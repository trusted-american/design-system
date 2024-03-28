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

interface _Predicate {
  label: string;
  key: string;
}

interface SelectPredicate<T> extends _Predicate {
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

interface StringPredicate extends _Predicate {
  type: 'string';
  value: string | undefined;
}

interface _DatePredicate extends _Predicate {
  type: 'date';
  value: DateRangeQueryParam;
  valueB?: Date | string; // TODO:
}

interface OffsetDatePredicate extends _DatePredicate {
  mode: 'inTheLast';
  valueA: number;
  valueB: 'months' | 'days';
}

interface RangeDatePredicate extends _DatePredicate {
  mode: 'between';
  valueA: Date;
  valueB: Date;
}

interface SingleDatePredicate extends _DatePredicate {
  mode?: 'equals' | 'isAfter' | 'isAfterOrOn' | 'isBefore' | 'isBeforeOrOn';
  valueA?: Date;
}

export type Predicate<T = unknown> =
  | SingleSelectPredicate<T>
  | MultiSelectPredicate<T>
  | StringPredicate
  | OffsetDatePredicate
  | RangeDatePredicate
  | SingleDatePredicate;

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
  predicates: Predicate<T>[];

  constructor(owner: unknown, args: ListFilterSignature<T>['Args']) {
    super(owner, args);

    this.predicates = this.args.predicates.map((p) => {
      const predicate = { ...p }; // clone

      if (predicate.type !== 'date' || Array.isArray(predicate.value)) {
        return predicate;
      }

      const { value } = predicate;
      if (value.gte && value.lte) {
        predicate.mode = 'between';
        predicate.valueA = value.gte;
        predicate.valueB = value.lte;
      } else if (value.gt) {
        predicate.mode = 'isAfter';
        predicate.valueA = value.gt;
      } else if (value.gte) {
        predicate.mode = 'isAfterOrOn';
        predicate.valueA = value.gte;
      } else if (value.lt) {
        predicate.mode = 'isBefore';
        predicate.valueA = value.lt;
      } else if (value.lte) {
        predicate.mode = 'isBeforeOrOn';
        predicate.valueA = value.lte;
      } else {
        predicate.mode = 'inTheLast';
      }

      return predicate;
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
  toggle(predicate: Predicate<T>, checked: boolean): void {
    if (checked) {
      if (predicate.type === 'multi') {
        set(predicate, 'value', [predicate.options[0]?.value as T]);
      } else if (predicate.type === 'string') {
        set(predicate, 'value', 'Text');
      } else if (predicate.type === 'date') {
        const valueA = new Date();
        const valueB = new Date();
        set(predicate, 'value', {
          gte: valueA,
          gt: null,
          lt: null,
          lte: valueB,
        });
        set(predicate, 'mode', 'between');
        set(predicate, 'valueA', valueA);
        set(predicate, 'valueB', valueB);
      } else {
        set(predicate, 'value', predicate.options[0]?.value);
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
              predicate.valueA,
              predicate.valueB === 'months' ? 'months' : 'days',
            )
            .toDate();
          value.lte = new Date();
        } else if (predicate.mode === 'equals') {
          value.gte = predicate.valueA as Date;
          value.lte = dayjs(predicate.valueA).endOf('day').toDate();
        } else if (predicate.mode === 'between') {
          value.gte = predicate.valueA;
          value.lte = predicate.valueB;
        } else if (predicate.mode === 'isAfter') {
          value.gt = predicate.valueA as Date;
        } else if (predicate.mode === 'isAfterOrOn') {
          value.gte = predicate.valueA as Date;
        } else if (predicate.mode === 'isBefore') {
          value.lt = predicate.valueA as Date;
        } else if (predicate.mode === 'isBeforeOrOn') {
          value.lte = predicate.valueA as Date;
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
