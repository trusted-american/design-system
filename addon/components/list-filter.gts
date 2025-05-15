import Component from '@glimmer/component';
import { cached, tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import dayjs from 'dayjs';
import checkValidity from '../utils/check-validity';
import Button from './button';
import ButtonSet from './button-set';
import Dropdown from './dropdown';
import ListGroup from './list-group';
import FormNumberInput from './form/number-input';
import FormDateInput from './form/date-input';
import FormCheck from './form/check';
import FormInput from './form/input';
import FormSelect from './form/select';
import FormPowerSelect from './form/power-select';
import dropdown from '../modifiers/dropdown';
import FormCheckInput from './form/check/input';
import { array, fn, hash } from '@ember/helper';
import { on } from '@ember/modifier';
import { eq, not } from 'ember-truth-helpers';
import { modifier } from 'ember-modifier';
import { get } from '@ember/object';
import { Dropdown as BootstrapDropdown } from 'bootstrap';
import { guidFor } from '@ember/object/internals';
import type { Option } from './form/select';
import { faFilter } from '@fortawesome/free-solid-svg-icons';

const findBy = <T,>(byPath: keyof T, value: T[keyof T], arr: T[]) =>
  arr.find((item) => get(item, String(byPath)) === value);

const includes = <T,>(value: T, arr: T[]) => arr.includes(value);

const hideDropdown = (id: string) => {
  const dropdownEl = document.getElementById(id);
  if (dropdownEl) {
    const dropdown = BootstrapDropdown.getInstance(dropdownEl);
    dropdown?.hide();
  }
};

const autoselect = modifier(function autoselect(element: HTMLInputElement) {
  element.select();
});

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

    const { value: val } = predicate;

    this._value = val;

    if ((val || val === false) && (!Array.isArray(val) || val.length !== 0)) {
      this.isEnabled = true;
    }

    if (predicate.type !== 'date') {
      return;
    }

    const { value } = predicate;

    if (Array.isArray(value)) {
      this.mode = 'between';
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
          this.offsetCount!,
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
    label: string;
    clearLabel: string;
    doneLabel: string;
    modeLabel: string;
    inTheLastLabel: string;
    equalsLabel: string;
    betweenLabel: string;
    isAfterLabel: string;
    isAfterOrOnLabel: string;
    isBeforeLabel: string;
    isBeforeOrOnLabel: string;
    valueLabel: string;
    valueALabel: string;
    valueBLabel: string;
    andLabel: string;
    daysLabel: string;
    monthsLabel: string;
    requiredLabel: string;
    chooseLabel: string;
    searchLabel: string;
    onChange: (key: string, value: unknown) => void;
  };
}

export default class ListFilter<T> extends Component<ListFilterSignature<T>> {
  id = guidFor(this);

  @cached
  get predicates(): InternalPredicate<T>[] {
    return this.args.predicates.map(
      (predicate) => new InternalPredicate(predicate),
    );
  }

  get selections(): InternalPredicate<T>[] {
    return this.predicates.filter(({ isEnabled }) => isEnabled);
  }

  @action
  @checkValidity
  done(): void {
    for (const predicate of this.predicates) {
      this.args.onChange(predicate._predicate.key, predicate.value);
    }

    hideDropdown(this.id);
  }

  @action
  clear(): void {
    for (const predicate of this.predicates) {
      predicate.isEnabled = false;
      this.args.onChange(predicate._predicate.key, predicate.value);
    }

    hideDropdown(this.id);
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
      predicate._value = [...(predicate._value as []), value];
    } else {
      predicate._value = (predicate._value as []).filter((v) => v !== value);
    }
  }

  <template>
    <Button
      @label={{@label}}
      @icon={{faFilter}}
      @count={{this.selections.length}}
      id={{this.id}}
      data-test-list-filter
      {{dropdown autoClose="outside"}}
    />

    <Dropdown class="p-0" data-test-list-filter-dropdown>
      <form novalidate {{on "submit" this.done}}>
        <ListGroup @isFlush={{true}} as |listGroup|>

          <listGroup.item class="bg-body-tertiary px-2">
            <ButtonSet class="justify-content-between" as |buttonSet|>
              <buttonSet.button
                @label={{@clearLabel}}
                data-test-clear
                {{on "click" this.clear}}
              />
              <buttonSet.button
                @type="submit"
                @label={{@doneLabel}}
                @color="primary"
                data-test-done
              />
            </ButtonSet>
          </listGroup.item>

          {{#each this.predicates as |predicate index|}}
            <label class="list-group-item px-2" data-test-predicate-toggle>
              <FormCheckInput
                @value={{predicate.isEnabled}}
                @label={{predicate._predicate.label}}
                @identifier="toggle{{index}}"
                @onChange={{fn
                  (mut predicate.isEnabled)
                  (not predicate.isEnabled)
                }}
                class="me-1"
              />
              {{predicate._predicate.label}}
            </label>

            {{#if predicate.isEnabled}}
              <listGroup.item
                class="bg-body-tertiary px-2"
                data-test-predicate-value
              >
                {{#if (eq "date" predicate._predicate.type)}}
                  <FormSelect
                    @options={{array
                      (hash value="inTheLast" label=@inTheLastLabel)
                      (hash value="equals" label=@equalsLabel)
                      (hash value="between" label=@betweenLabel)
                      (hash value="isAfter" label=@isAfterLabel)
                      (hash value="isAfterOrOn" label=@isAfterOrOnLabel)
                      (hash value="isBefore" label=@isBeforeLabel)
                      (hash value="isBeforeOrOn" label=@isBeforeOrOnLabel)
                    }}
                    @selected={{predicate.mode}}
                    @label={{@modeLabel}}
                    @identifier="mode{{index}}"
                    @requiredLabel={{@requiredLabel}}
                    @isInputOnly={{true}}
                    @onChange={{fn (mut predicate.mode)}}
                    class="mb-2"
                    data-test-mode
                  />

                  <div class="d-flex align-items-center gap-2">
                    {{#if (eq "inTheLast" predicate.mode)}}
                      <FormNumberInput
                        @value={{predicate.offsetCount}}
                        @label={{@valueALabel}}
                        @identifier="valueA{{index}}"
                        @isRequired={{true}}
                        @requiredLabel={{@requiredLabel}}
                        @isInputOnly={{true}}
                        @onChange={{fn (mut predicate.offsetCount)}}
                        min="1"
                      />
                      <FormSelect
                        @options={{array
                          (hash value="days" label=@daysLabel)
                          (hash value="months" label=@monthsLabel)
                        }}
                        @selected={{predicate.offsetMode}}
                        @label={{@valueBLabel}}
                        @identifier="valueB{{index}}"
                        @requiredLabel={{@requiredLabel}}
                        @isInputOnly={{true}}
                        @onChange={{fn (mut predicate.offsetMode)}}
                      />
                    {{else}}
                      <FormDateInput
                        @value={{predicate.startAt}}
                        @label={{@valueALabel}}
                        @identifier="valueA{{index}}"
                        @isRequired={{true}}
                        @requiredLabel={{@requiredLabel}}
                        @isInputOnly={{true}}
                        @isLocalTimeZone={{true}}
                        @onChange={{fn (mut predicate.startAt)}}
                      />
                      {{#if (eq "between" predicate.mode)}}
                        <div>{{@andLabel}}</div>
                        <FormDateInput
                          @value={{predicate.endAt}}
                          @label={{@valueBLabel}}
                          @identifier="valueB{{index}}"
                          @isRequired={{true}}
                          @requiredLabel={{@requiredLabel}}
                          @isInputOnly={{true}}
                          @isLocalTimeZone={{true}}
                          @onChange={{fn this.setEndAt predicate}}
                        />
                      {{/if}}
                    {{/if}}
                  </div>

                {{else if (eq "multi" predicate._predicate.type)}}

                  {{#each predicate._predicate.options as |opt|}}
                    <FormCheck
                      @value={{includes opt.value predicate._predicate.value}}
                      @label={{opt.label}}
                      @identifier="value{{index}}{{opt.value}}"
                      @requiredLabel={{@requiredLabel}}
                      @onChange={{fn this.toggleMulti predicate opt.value}}
                    />
                  {{/each}}

                {{else if (eq "string" predicate._predicate.type)}}

                  <FormInput
                    @value={{predicate._predicate.value}}
                    @label={{@valueLabel}}
                    @identifier="value{{index}}"
                    @isRequired={{true}}
                    @requiredLabel={{@requiredLabel}}
                    @isInputOnly={{true}}
                    @onChange={{fn (mut predicate._value)}}
                    placeholder={{@valueLabel}}
                    {{autoselect}}
                  />

                {{else}}

                  {{#let predicate._predicate.options as |o|}}
                    <FormPowerSelect
                      @options={{o}}
                      {{! @glint-expect-error }}
                      @selected={{findBy "value" predicate._value o}}
                      @searchField="label"
                      @label={{@valueLabel}}
                      @identifier="value{{index}}"
                      {{!-- @isRequired={{true}} --}}
                      @requiredLabel={{@requiredLabel}}
                      @isInputOnly={{true}}
                      @chooseLabel={{@chooseLabel}}
                      @searchLabel={{@searchLabel}}
                      @onChange={{fn this.setValue predicate}}
                      as |option|
                    >
                      {{option.label}}
                    </FormPowerSelect>
                  {{/let}}

                {{/if}}
              </listGroup.item>
            {{/if}}
          {{/each}}
        </ListGroup>
      </form>
    </Dropdown>
  </template>
}
