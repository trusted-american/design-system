import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import dayjs from 'dayjs';

import type { Option } from '@trusted-american/design-system/components/form/select';

export type DateRangeQueryParam =
  | {
      gte: Date | null;
      gt: Date | null;
      lt: Date | null;
      lte: Date | null;
    }
  | [];

interface BasePredicate {
  label: string;
  key: string;
}

interface SelectPredicate<T> extends BasePredicate {
  options: Option<T>[];
}

interface SingleSelectPredicate<T> extends SelectPredicate<T> {
  type?: 'single';
  value: T | undefined;
}

interface MultiSelectPredicate<T> extends SelectPredicate<T> {
  type: 'multi';
  value: T[];
}

interface StringPredicate extends BasePredicate {
  type: 'string';
  value: string | undefined;
}

interface DatePredicate extends BasePredicate {
  type: 'date';
  value: DateRangeQueryParam;
}

export type Predicate<T = unknown> =
  | SingleSelectPredicate<T>
  | MultiSelectPredicate<T>
  | StringPredicate
  | DatePredicate;

class InternalPredicate<T> {
  _predicate: Predicate<T>;

  @tracked isEnabled = false;

  @tracked _value: Predicate<T>['value'];

  @tracked mode:
    | 'inTheLast'
    | 'equals'
    | 'between'
    | 'isAfter'
    | 'isAfterOrOn'
    | 'isBefore'
    | 'isBeforeOrOn' = 'inTheLast';

  @tracked offsetCount: number | null = 1;
  @tracked offsetMode: 'days' | 'months' = 'days';

  @tracked startAt: Date | null = null;
  @tracked endAt: Date | null = null;

  constructor(predicate: Predicate<T>) {
    this._predicate = predicate;
    this._value = predicate.value;

    const { value: val } = predicate;

    if ((val || val === false) && (!Array.isArray(val) || val.length !== 0)) {
      this.isEnabled = true;
    }

    if (predicate.type !== 'date') {
      return;
    }

    const { value } = predicate;

    if (Array.isArray(value)) {
      this.mode = 'inTheLast';
      this.offsetCount = 1;
      this.offsetMode = 'days';
    } else if (value.gte && value.lte) {
      this.mode = 'between';
      this.startAt = value.gte;
      this.endAt = value.lte;
    } else if (value.gt) {
      this.mode = 'isAfter';
      this.startAt = value.gt;
    } else if (value.gte) {
      this.mode = 'isAfterOrOn';
      this.startAt = value.gte;
    } else if (value.lt) {
      this.mode = 'isBefore';
      this.startAt = value.lt;
    } else if (value.lte) {
      this.mode = 'isBeforeOrOn';
      this.startAt = value.lte;
    }
  }

  get value() {
    if (!this.isEnabled) {
      if (this._predicate.type === 'date' || this._predicate.type === 'multi') {
        return [];
      }
      return undefined;
    }

    if (this._predicate.type !== 'date') {
      return this._value;
    }

    const value: DateRangeQueryParam = {
      gte: null,
      gt: null,
      lt: null,
      lte: null,
    };

    if (this.mode === 'inTheLast') {
      value.gte = dayjs()
        .subtract(
          this.offsetCount as number,
          this.offsetMode === 'months' ? 'months' : 'days',
        )
        .toDate();
      value.lte = new Date();
    } else if (this.mode === 'equals') {
      value.gte = this.startAt;
      value.lte = dayjs(this.startAt).endOf('day').toDate();
    } else if (this.mode === 'between') {
      value.gte = this.startAt;
      value.lte = this.endAt;
    } else if (this.mode === 'isAfter') {
      value.gt = this.startAt;
    } else if (this.mode === 'isAfterOrOn') {
      value.gte = this.startAt;
    } else if (this.mode === 'isBefore') {
      value.lt = this.startAt;
    } else {
      value.lte = this.startAt;
    }

    return value;
  }
}

export interface ListFilterSignature<T> {
  Args: {
    predicates: Predicate<T>[];
    text: string;
    clearText: string;
    doneText: string;
    modeText: string;
    inTheLastText: string;
    equalsText: string;
    betweenText: string;
    isAfterText: string;
    isAfterOrOnText: string;
    isBeforeText: string;
    isBeforeOrOnText: string;
    valueText: string;
    valueAText: string;
    valueBText: string;
    andText: string;
    daysText: string;
    monthsText: string;
    chooseText: string;
    searchText: string;
    onChange: (key: string, value: unknown) => void;
  };
}

export default class ListFilter<T> extends Component<ListFilterSignature<T>> {
  predicates: InternalPredicate<T>[];

  constructor(owner: unknown, args: ListFilterSignature<T>['Args']) {
    super(owner, args);

    this.predicates = this.args.predicates.map(
      (predicate) => new InternalPredicate(predicate),
    );
  }

  get selections(): InternalPredicate<T>[] {
    return this.predicates.filter(({ isEnabled }) => isEnabled);
  }

  @action
  done(event: Event): void {
    event.preventDefault();

    if (!(event.target instanceof HTMLFormElement)) {
      throw new Error();
    }

    const form = event.target;
    if (!form.checkValidity()) {
      form.classList.add('was-validated');
      return;
    }
    form.classList.remove('was-validated');

    for (const predicate of this.predicates) {
      this.args.onChange(predicate._predicate.key, predicate.value);
    }
  }

  @action
  clear(): void {
    for (const predicate of this.predicates) {
      predicate.isEnabled = false;
      this.args.onChange(predicate._predicate.key, predicate.value);
    }
  }

  @action
  setValue(predicate: InternalPredicate<T>, opt: Option<T>): void {
    predicate._value = opt.value;
  }

  @action
  setEndAt(predicate: InternalPredicate<T>, date: Date | null): void {
    predicate.endAt = dayjs(date).endOf('day').toDate();
  }

  @action
  toggleMulti(
    predicate: InternalPredicate<T>,
    value: T,
    checked: boolean,
  ): void {
    if (checked) {
      predicate._value = [...predicate._value, value];
    } else {
      predicate._value = predicate._value.filter((v) => v !== value);
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListFilter: typeof ListFilter;
  }
}
