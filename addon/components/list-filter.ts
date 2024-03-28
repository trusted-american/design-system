import Component from '@glimmer/component';
import { action, set } from '@ember/object';
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

type InternalPredicate<T = unknown> =
  | SingleSelectPredicate<T>
  | MultiSelectPredicate<T>
  | StringPredicate
  | _OffsetDatePredicate
  | _RangeDatePredicate
  | _SingleDatePredicate;

export interface ListFilterSignature<T> {
  Args: {
    predicates: Predicate<T>[];
    text: string;
    clearText: string;
    doneText: string;
    onChange: (key: string, value: unknown) => void;
  };
}

export default class ListFilter<T> extends Component<ListFilterSignature<T>> {
  predicates: InternalPredicate<T>[];

  constructor(owner: unknown, args: ListFilterSignature<T>['Args']) {
    super(owner, args);

    this.predicates = this.args.predicates.map((predicate) => {
      if (predicate.type !== 'date') {
        return { ...predicate };
      }

      if (Array.isArray(predicate.value)) {
        return {
          ...predicate,
          mode: 'inTheLast',
          valueA: 1,
          valueB: 'days',
        };
      }

      const { value } = predicate;
      if (value.gte && value.lte) {
        return {
          ...predicate,
          mode: 'between',
          valueA: value.gte,
          valueB: value.lte,
        };
      } else if (value.gt) {
        return {
          ...predicate,
          mode: 'isAfter',
          valueA: value.gt,
        };
      } else if (value.gte) {
        return {
          ...predicate,
          mode: 'isAfterOrOn',
          valueA: value.gte,
        };
      } else if (value.lt) {
        return {
          ...predicate,
          mode: 'isBefore',
          valueA: value.lt,
        };
      } else if (value.lte) {
        return {
          ...predicate,
          mode: 'isBeforeOrOn',
          valueA: value.lte,
        };
      } else {
        return {
          ...predicate,
          mode: 'inTheLast',
          valueA: 1,
          valueB: 'days',
        };
      }
    });
  }

  get selections(): Predicate<T>[] {
    return this.args.predicates.filter(
      ({ value }) =>
        (Boolean(value) || value === false) &&
        (!Array.isArray(value) || value.length),
    );
  }

  @action
  toggle(predicate: InternalPredicate<T>, checked: boolean): void {
    if (checked) {
      if (predicate.type === 'multi') {
        const [option] = predicate.options;
        const value = option ? [option.value] : [];
        set(predicate, 'value', value);
      } else if (predicate.type === 'string') {
        set(predicate, 'value', 'Text');
      } else if (predicate.type === 'date') {
        const djs = dayjs();
        const valueA = djs.startOf('day').toDate();
        const valueB = djs.endOf('day').toDate();
        set(predicate, 'value', {
          gte: valueA,
          gt: null,
          lt: null,
          lte: valueB,
        });
        set(predicate, 'mode', 'between');
        set(predicate, 'valueA', valueA);
        set(predicate as _RangeDatePredicate, 'valueB', valueB);
      } else {
        const [option] = predicate.options;
        set(predicate, 'value', option?.value);
      }
    } else {
      if (predicate.type === 'date' || predicate.type === 'multi') {
        set(predicate, 'value', []);
      } else {
        set(predicate, 'value', undefined);
      }
    }
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
      this.toggle(predicate, false);

      const { key, value } = predicate;
      this.args.onChange(key, value);
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

    const predicates = this.predicates.map((predicate) => {
      if (predicate.type === 'date' && !Array.isArray(predicate.value)) {
        const value: DateRangeQueryParam = {
          gte: null,
          gt: null,
          lt: null,
          lte: null,
        };

        if (predicate.mode === 'inTheLast') {
          value.gte = dayjs()
            .subtract(
              predicate.valueA as number,
              predicate.valueB === 'months' ? 'months' : 'days',
            )
            .toDate();
          value.lte = new Date();
        } else if (predicate.mode === 'equals') {
          value.gte = predicate.valueA;
          value.lte = dayjs(predicate.valueA).endOf('day').toDate();
        } else if (predicate.mode === 'between') {
          value.gte = predicate.valueA;
          value.lte = predicate.valueB;
        } else if (predicate.mode === 'isAfter') {
          value.gt = predicate.valueA;
        } else if (predicate.mode === 'isAfterOrOn') {
          value.gte = predicate.valueA;
        } else if (predicate.mode === 'isBefore') {
          value.lt = predicate.valueA;
        } else {
          value.lte = predicate.valueA;
        }
        set(predicate, 'value', value);
      }
      return predicate;
    });

    for (const { key, value } of predicates) {
      this.args.onChange(key, value);
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListFilter: typeof ListFilter;
  }
}
