import Component from '@glimmer/component';
import PowerSelectMultipleWithCreate from 'ember-power-select-with-create/components/power-select-multiple-with-create';
import PowerSelectMultiple from 'ember-power-select/components/power-select-multiple';
import FormFeedback from './feedback';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';

interface Args<T> extends FormInputArgs {
  options: T[];
  selected: T[];
  disabled?: boolean;
  placeholder?: string;
  renderInPlace?: boolean;
  searchEnabled?: boolean;
  searchField?: string;
  matcher?: (value: T, query: string) => number;
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
        @requiredLabel={{@requiredLabel}}
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
        @matcher={{@matcher}}
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
        @matcher={{@matcher}}
        @onChange={{@onChange}}
        id={{@identifier}}
        ...attributes
        as |option|
      >
        {{yield option}}
      </PowerSelectMultiple>
    {{/if}}

    <FormFeedback @validLabel={{@validLabel}} @invalidLabel={{@invalidLabel}} />

    {{#each @errors as |error|}}
      <FormFeedback @validLabel={{undefined}} @invalidLabel={{error.message}} />
    {{/each}}

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
