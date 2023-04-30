import Component from '@glimmer/component';
import { assert } from '@ember/debug';
import { typeOf } from '@ember/utils';
import { action, set } from '@ember/object';
import { hash } from '@ember/helper';
import * as dayjs from 'dayjs';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import BsButton from 'ember-simple-bootstrap/components/bs/button';
import BsDropdown from 'ember-simple-bootstrap/components/bs/dropdown';
import BsListGroup from 'ember-simple-bootstrap/components/bs/list-group';
import BsToolbar from 'ember-simple-bootstrap/components/bs/toolbar';
import dropdown from 'ember-simple-bootstrap/modifiers/dropdown';
import { array, fn } from '@ember/helper';
import { on } from '@ember/modifier';
// @ts-ignore
import eq from 'ember-truth-helpers/helpers/eq';
// @ts-ignore
import or from 'ember-truth-helpers/helpers/or';
import { Input } from '@ember/component';
import FormCheck from './form/check';
import FormDateInput from './form/date-input';
import FormSelect from './form/select';
// @ts-ignore
import includes from 'ember-composable-helpers/helpers/includes';
// @ts-ignore
import pick from 'ember-composable-helpers/helpers/pick';

import type { Option } from '@trusted-american/design-system/components/form/select';

type DateRangeQueryParam =
  | {
      gte: Date | null;
      gt: Date | null;
      lt: Date | null;
      lte: Date | null;
    }
  | [];

interface P {
  name: string;
  key: string;
}

interface SelectP<T> extends P {
  options: [Option<T>, ...Option<T>[]];
}

interface SingleSelectP<T> extends SelectP<T> {
  type?: 'single';
  value: T | undefined;
}

interface MultiSelectP<T> extends SelectP<T> {
  type: 'multi';
  value: T[];
}

interface StringP extends P {
  type: 'string';
  value: string | undefined;
}

interface DateP extends P {
  type: 'date';
  value: DateRangeQueryParam;
  valueB?: Date | string; // TODO:
}

interface ADateP extends DateP {
  mode: 'inTheLast';
  valueA: number;
  valueB: 'months' | 'days';
}

interface BDateP extends DateP {
  mode: 'between';
  valueA: Date;
  valueB: Date;
}

interface CDateP extends DateP {
  mode?: 'equals' | 'isAfter' | 'isAfterOrOn' | 'isBefore' | 'isBeforeOrOn';
  valueA?: Date;
}

export type Predicate<T = unknown> =
  | SingleSelectP<T>
  | MultiSelectP<T>
  | StringP
  | ADateP
  | BDateP
  | CDateP;

export interface ListFilterComponentSignature<T> {
  Args: {
    predicates: Predicate<T>[];
    onChange: (key: string, value: unknown) => void;
  };
}

export default class ListFilterComponent<T> extends Component<
  ListFilterComponentSignature<T>
> {
  predicates: Predicate<T>[];

  constructor(owner: unknown, args: ListFilterComponentSignature<T>['Args']) {
    super(owner, args);

    assert(
      '<ListFilter />: Must pass a predicates array',
      typeOf(this.args.predicates) === 'array'
    );
    assert(
      '<ListFilter />: Must pass an onChange function',
      typeOf(this.args.onChange) === 'function'
    );

    this.predicates = this.args.predicates.map((p) => {
      const predicate = { ...p }; // clone

      if (predicate.type === 'date' && !Array.isArray(predicate.value)) {
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
      }

      return predicate;
    });
  }

  get selections(): Predicate<T>[] {
    return this.args.predicates.filter(
      ({ value }) =>
        (Boolean(value) || value === false) &&
        (!Array.isArray(value) || value.length)
    );
  }

  @action
  toggle(predicate: Predicate<T>, checked: boolean): void {
    if (checked) {
      if (predicate.type === 'multi') {
        set(predicate, 'value', [predicate.options[0].value]);
      } else if (predicate.type === 'string') {
        set(predicate, 'value', 'Text');
      } else if (predicate.type === 'date') {
        set(predicate, 'value', {
          gte: new Date(),
          gt: null,
          lt: null,
          lte: new Date(),
        });
        set(predicate, 'mode', 'between');
        set(predicate, 'valueA', new Date());
        set(predicate, 'valueB', new Date());
      } else {
        set(predicate, 'value', predicate.options[0].value);
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
  toggleMulti(predicate: MultiSelectP<T>, value: T, checked: boolean): void {
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
              predicate.valueB === 'months' ? 'months' : 'days'
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

  <template>
    {{! @glint-nocheck }}

    <BsButton data-test-list-filter {{dropdown autoClose="outside"}}>
      <FaIcon @icon="filter" @fixedWidth={{true}} />
      Filter
      {{#if this.selections}}
        <span class="text-danger ms-1">
          {{this.selections.length}}
        </span>
      {{/if}}
    </BsButton>

    <BsDropdown @align="right" class="p-0" data-test-list-filter-dropdown>
      <form novalidate {{on "submit" this.done}}>
        <BsListGroup @flush={{true}} as |listGroup|>

          <listGroup.item class="bg-light px-2">
            <BsToolbar class="justify-content-between" as |toolbar|>
              <toolbar.group as |group|>
                <group.button {{on "click" this.clear}} data-test-clear>
                  Clear
                </group.button>
              </toolbar.group>
              <toolbar.group as |group|>
                <group.button @isSubmit={{true}} @color="primary" data-test-done>
                  Done
                </group.button>
              </toolbar.group>
            </BsToolbar>
          </listGroup.item>

          {{#each this.predicates as |predicate index|}}

            <label class="list-group-item px-2" data-test-predicate-toggle>
              <input
                checked={{or predicate.value (eq false predicate.value)}}
                type="checkbox"
                class="form-check-input me-1"
                {{on "change" (pick "target.checked" (fn this.toggle predicate))}}
              />
              {{predicate.name}}
            </label>

            {{#if (or predicate.value (eq false predicate.value))}}
              <listGroup.item class="bg-light px-2" data-test-predicate-value>

                {{#if (eq "date" predicate.type)}}
                  <FormSelect
                    @options={{array
                      (hash value="inTheLast" label="is in the last")
                      (hash value="equals" label="is equal to")
                      (hash value="between" label="is between")
                      (hash value="isAfter" label="is after")
                      (hash value="isAfterOrOn" label="is on or after")
                      (hash value="isBefore" label="is before")
                      (hash value="isBeforeOrOn" label="is before or on")
                    }}
                    @selected={{predicate.mode}}
                    @identifier="mode{{index}}"
                    @onChange={{fn (mut predicate.mode)}}
                    aria-label="Mode"
                    class="mb-2"
                  />

                  <div class="d-flex align-items-center gap-2">
                    {{#if (eq "inTheLast" predicate.mode)}}
                      <Input
                        @value={{predicate.valueA}}
                        @type="number"
                        min="1"
                        class="form-control"
                        aria-label="Value A"
                        required
                      />
                      <FormSelect
                        @options={{array
                          (hash value="days" label="Days")
                          (hash value="months" label="Months")
                        }}
                        @selected={{predicate.valueB}}
                        @identifier="valueB{{index}}"
                        @onChange={{fn (mut predicate.valueB)}}
                        aria-label="Value B"
                      />
                    {{else}}
                      <FormDateInput
                        @value={{predicate.valueA}}
                        @identifier=""
                        @required={{true}}
                        @onChange={{fn (mut predicate.valueA)}}
                      />
                      {{#if (eq "between" predicate.mode)}}
                        <div>
                          and
                        </div>
                        <FormDateInput
                          @value={{predicate.valueB}}
                          @identifier=""
                          @required={{true}}
                          @onChange={{fn (mut predicate.valueB)}}
                        />
                      {{/if}}
                    {{/if}}
                  </div>

                {{else if (eq "multi" predicate.type)}}

                  {{#each predicate.options as |opt|}}
                    <FormCheck
                      @value={{includes opt.value predicate.value}}
                      @label={{opt.label}}
                      @identifier={{opt.value}}
                      {{on
                        "change"
                        (pick
                          "target.checked" (fn this.toggleMulti predicate opt.value)
                        )
                      }}
                    />
                  {{/each}}

                {{else if (eq "string" predicate.type)}}

                  <Input
                    @value={{predicate.value}}
                    @type="text"
                    class="form-control"
                    aria-label="Value"
                  />

                {{else}}

                  <FormSelect
                    @options={{predicate.options}}
                    @selected={{predicate.value}}
                    @identifier="value{{index}}"
                    @onChange={{fn (mut predicate.value)}}
                    aria-label="Value"
                  />

                {{/if}}
              </listGroup.item>
            {{/if}}

          {{/each}}

        </BsListGroup>
      </form>
    </BsDropdown>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListFilter: typeof ListFilterComponent;
  }
}
