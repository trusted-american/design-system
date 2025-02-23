import Component from '@glimmer/component';
import { action } from '@ember/object';
import FormFeedback from './feedback';
import FormHelp from './help';
import FormLabel from './label';
import { concat } from '@ember/helper';
import { on } from '@ember/modifier';
import { eq, not, or } from 'ember-truth-helpers';

import type { BaseArgs } from './input';

const isOption = <T,>(option: T | Option<T> | Group<T>): option is Option<T> =>
  option && typeof option === 'object' && 'label' in option;

const isGroup = <T,>(option: T | Option<T> | Group<T>): option is Group<T> =>
  option && typeof option === 'object' && 'groupLabel' in option;

export interface Option<T> {
  value: T;
  label: string;
}

interface Group<T> {
  groupLabel: string;
  options: Option<T>[];
}

interface Args<T> extends BaseArgs {
  options: (T | Option<T> | Group<T>)[];
  selected: T;
  chooseLabel?: string;
  onChange: (value: T) => void;
}

export interface FormSelectSignature<T> {
  Args: Args<T>;
  Element: HTMLSelectElement;
}

export default class FormSelect<T> extends Component<FormSelectSignature<T>> {
  @action
  change({ target }: Event): void {
    if (!(target instanceof HTMLSelectElement)) {
      throw new Error();
    }

    const options = this.args.options;

    const index = parseInt(target.value);
    let selected = options[index] ?? null;

    if (target.value.includes('-')) {
      const [groupIndex, optionIndex] = target.value.split('-').map(parseInt);
      if (groupIndex && optionIndex) {
        const group = (options as Group<T>[])[groupIndex];
        const option = group?.options[optionIndex];
        if (option) {
          selected = option;
        }
      }
    }

    if (selected && typeof selected === 'object' && 'groupLabel' in selected) {
      const [firstOption] = selected.options;
      if (firstOption) {
        this.args.onChange(firstOption.value);
      }
    } else if (
      selected &&
      typeof selected === 'object' &&
      'label' in selected
    ) {
      this.args.onChange(selected.value);
    } else {
      this.args.onChange(selected as T);
    }
  }

  <template>
    <FormLabel
      @label={{unless @isInputOnly @label}}
      @identifier={{@identifier}}
      @isRequired={{@isRequired}}
    />

    <select
      id={{@identifier}}
      class="form-select {{if @size (concat 'form-select-' @size)}}"
      required={{@isRequired}}
      aria-label={{if @isInputOnly @label}}
      data-test-form-select
      {{on "change" this.change}}
      ...attributes
    >
      {{#if @chooseLabel}}
        {{! @glint-expect-error }}
        <option value="" selected={{not @selected}}>
          {{@chooseLabel}}
        </option>
      {{/if}}
      {{#each @options as |opt index|}}
        {{#if (isGroup opt)}}
          <optgroup label={{opt.groupLabel}}>
            {{#each opt.options as |subOpt subIndex|}}
              <option
                value="{{index}}-{{if
                  (or subOpt.value (eq false subOpt.value))
                  subIndex
                  ''
                }}"
                selected={{eq @selected subOpt.value}}
              >
                {{subOpt.label}}
              </option>
            {{/each}}
          </optgroup>
        {{else if (isOption opt)}}
          <option
            value={{if (or opt.value (eq false opt.value)) index ""}}
            selected={{eq @selected opt.value}}
          >
            {{opt.label}}
          </option>
        {{else}}
          <option
            value={{if (or opt (eq false opt)) index ""}}
            selected={{eq @selected opt}}
          >
            {{! @glint-expect-error }}
            {{opt}}
          </option>
        {{/if}}
      {{/each}}
    </select>

    <FormFeedback @label={{@invalidFeedback}} />

    {{#each @errors as |error|}}
      <FormFeedback @label={{error.message}} />
    {{/each}}

    <FormHelp @label={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Select': typeof FormSelect;
  }
}
