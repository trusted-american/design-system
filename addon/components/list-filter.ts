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

interface _OffsetDatePredicate extends DatePredicate {
  mode: 'inTheLast';
  valueA: number | null;
  valueB: 'months' | 'days';
}

interface _RangeDatePredicate extends DatePredicate {
  mode: 'between';
  valueA: Date | null;
  valueB: Date | null;
}

interface _SingleDatePredicate extends DatePredicate {
  mode: 'equals' | 'isAfter' | 'isAfterOrOn' | 'isBefore' | 'isBeforeOrOn';
  valueA: Date | null;
}

export type Predicate<T = unknown> =
  | SingleSelectPredicate<T>
  | MultiSelectPredicate<T>
  | StringPredicate
  | DatePredicate;

type InternalPredicate<T> =
  | SingleSelectPredicate<T>
  | MultiSelectPredicate<T>
  | StringPredicate
  | _OffsetDatePredicate
  | _RangeDatePredicate
  | _SingleDatePredicate;

class _InternalPredicate<T> {
  _predicate: InternalPredicate<T>;

  @tracked isEnabled = false;

  // @tracked mode?: InternalPredicate<T>['mode'];
  // value: PredicateParams['value'];

  @tracked _value: InternalPredicate<T>['value'];

  constructor(predicate: Predicate<T>) {
    this._predicate = { ...predicate } as InternalPredicate<T>;

    this._value = predicate.value;

    const { value: val } = predicate;

    if ((val || val === false) && (!Array.isArray(val) || val.length !== 0)) {
      this.isEnabled = true;
    }

    if (this._predicate.type !== 'date') {
      return;
    }

    const { value } = this._predicate;

    if (Array.isArray(value)) {
      this._predicate.mode = 'inTheLast';
      this._predicate.valueA = 1;
      (this._predicate as _OffsetDatePredicate).valueB = 'days';
      return;
    } else if (value.gte && value.lte) {
      this._predicate.mode = 'between';
      this._predicate.valueA = value.gte;
      (this._predicate as _RangeDatePredicate).valueB = value.lte;
    } else if (value.gt) {
      this._predicate.mode = 'isAfter';
      this._predicate.valueA = value.gt;
    } else if (value.gte) {
      this._predicate.mode = 'isAfterOrOn';
      this._predicate.valueA = value.gte;
    } else if (value.lt) {
      this._predicate.mode = 'isBefore';
      this._predicate.valueA = value.lt;
    } else if (value.lte) {
      this._predicate.mode = 'isBeforeOrOn';
      this._predicate.valueA = value.lte;
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

    if (Array.isArray(this._value)) {
      return [];
    }

    const value: DateRangeQueryParam = {
      gte: null,
      gt: null,
      lt: null,
      lte: null,
    };

    if (this._predicate.mode === 'inTheLast') {
      value.gte = dayjs()
        .subtract(
          this._predicate.valueA as number,
          this._predicate.valueB === 'months' ? 'months' : 'days',
        )
        .toDate();
      value.lte = new Date();
    } else if (this._predicate.mode === 'equals') {
      value.gte = this._predicate.valueA;
      value.lte = dayjs(this._predicate.valueA).endOf('day').toDate();
    } else if (this._predicate.mode === 'between') {
      value.gte = this._predicate.valueA;
      value.lte = this._predicate.valueB;
    } else if (this._predicate.mode === 'isAfter') {
      value.gt = this._predicate.valueA;
    } else if (this._predicate.mode === 'isAfterOrOn') {
      value.gte = this._predicate.valueA;
    } else if (this._predicate.mode === 'isBefore') {
      value.lt = this._predicate.valueA;
    } else {
      value.lte = this._predicate.valueA;
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
  predicates: _InternalPredicate<T>[];

  constructor(owner: unknown, args: ListFilterSignature<T>['Args']) {
    super(owner, args);

    this.predicates = this.args.predicates.map(
      (predicate) => new _InternalPredicate(predicate),
    );
  }

  get selections(): Predicate<T>[] {
    return this.args.predicates.filter(
      ({ value }) =>
        (Boolean(value) || value === false) &&
        (!Array.isArray(value) || value.length),
    );
  }

  @action
  setValueB(predicate: _RangeDatePredicate, date: Date | null): void {
    predicate.valueB = dayjs(date).endOf('day').toDate();
  }

  @action
  toggleMulti(
    predicate: MultiSelectPredicate<T>,
    value: T,
    checked: boolean,
  ): void {
    if (checked) {
      predicate.value = [...predicate.value, value];
    } else {
      predicate.value = predicate.value.filter((v) => v !== value);
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
  done(event: Event): void {
    event.preventDefault();

    const form = event.target as HTMLFormElement;
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
  change(predicate: _InternalPredicate<T>, opt: Option<T>) {
    predicate._value = opt.value;
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListFilter: typeof ListFilter;
  }
}
