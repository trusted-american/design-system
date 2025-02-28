import Component from '@glimmer/component';
import FormLabel from './label';
import FormFeedback from './feedback';
import FormHelp from './help';
import PowerSelectMultiple from 'ember-power-select/components/power-select-multiple';
import PowerSelectMultipleWithCreate from 'ember-power-select-with-create/components/power-select-multiple-with-create';

import type { BaseArgs } from './input';

interface Args<T> extends BaseArgs {
  options: T[];
  selected: T[];
  disabled?: boolean;
  placeholder?: string;
  renderInPlace?: boolean;
  searchEnabled?: boolean;
  searchField?: string;
  chooseLabel: string;
  onChange: (selected: T[]) => void;
  onCreate?: (query: string) => void;
}

export interface FormPowerSelectMultipleSignature<T> {
  Args: Args<T>;
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}

export default class FormPowerSelectMultiple<T> extends Component<
  FormPowerSelectMultipleSignature<T>
> {
  <template>
    {{#unless @isInputOnly}}
      <FormLabel
        @label={{@label}}
        @identifier={{@identifier}}
        @isRequired={{@isRequired}}
      />
    {{/unless}}

    {{#if @onCreate}}
      <PowerSelectMultipleWithCreate
        @options={{@options}}
        @selected={{@selected}}
        @disabled={{@disabled}}
        @placeholder={{@chooseLabel}}
        @renderInPlace={{true}}
        @searchEnabled={{true}}
        @searchField={{@searchField}}
        @onChange={{@onChange}}
        @onCreate={{@onCreate}}
        id={{@identifier}}
        ...attributes
        as |option|
      >
        {{yield option}}
      </PowerSelectMultipleWithCreate>
    {{else}}
      <PowerSelectMultiple
        @options={{@options}}
        @selected={{@selected}}
        @disabled={{@disabled}}
        @placeholder={{@chooseLabel}}
        @renderInPlace={{true}}
        @searchEnabled={{true}}
        @searchField={{@searchField}}
        @onChange={{@onChange}}
        id={{@identifier}}
        ...attributes
        as |option|
      >
        {{yield option}}
      </PowerSelectMultiple>
    {{/if}}

    <FormFeedback @label={{@invalidFeedback}} />

    {{#each @errors as |error|}}
      <FormFeedback @label={{error.message}} />
    {{/each}}

    <FormHelp @label={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::PowerSelectMultiple': typeof FormPowerSelectMultiple;
  }
}
