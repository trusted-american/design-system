import Component from '@glimmer/component';
import { action } from '@ember/object';
import FormFeedback from './feedback';
import FormHelp from './help';
import FormLabel from './label';
import { concat } from '@ember/helper';
import { on } from '@ember/modifier';
import { eq, not, or } from 'ember-truth-helpers';

import type { BaseArgs } from './input';

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
      const [optIndex, subOptIndex] = target.value.split('-');
      if (optIndex && subOptIndex) {
        // eslint-disable-next-line @typescript-eslint/no-non-null-asserted-optional-chain
        selected = (options as Group<T>[])[parseInt(optIndex)]?.options[
          parseInt(subOptIndex)
        ]!;
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
        {{! @glint-expect-error }}
        {{#if opt.groupLabel}}
          {{! @glint-expect-error }}
          <optgroup label={{opt.groupLabel}}>
            {{! @glint-expect-error }}
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
          {{! @glint-expect-error }}
        {{else if opt.label}}
          <option
            {{! @glint-expect-error }}
            value={{if (or opt.value (eq false opt.value)) index ""}}
            {{! @glint-expect-error }}
            selected={{eq @selected opt.value}}
          >
            {{! @glint-expect-error }}
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
