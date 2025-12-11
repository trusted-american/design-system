import Component from '@glimmer/component';
import PowerSelectWithCreate from 'ember-power-select-with-create/components/power-select-with-create';
import PowerSelect from 'ember-power-select/components/power-select';
import FormFeedback from './feedback';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';
import type { Group } from './power-select';

interface Args<T> extends FormInputArgs {
  options: (T | Group<T>)[];
  selected: T[];
  search?: (query: string) => T[];
  searchField?: keyof T & string;
  matcher?: (value: T, query: string) => number;
  isClearable?: boolean;
  isDisabled?: boolean;
  verticalPosition?: 'auto' | 'above' | 'below';
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
      <PowerSelectWithCreate
        @multiple={{true}}
        @options={{@options}}
        @search={{@search}}
        @selected={{@selected}}
        @disabled={{@isDisabled}}
        @placeholder={{@chooseLabel}}
        @searchEnabled={{true}}
        @searchField={{@searchField}}
        @matcher={{@matcher}}
        @allowClear={{@isClearable}}
        @verticalPosition={{@verticalPosition}}
        @triggerId={{@identifier}}
        @showCreatePosition="bottom"
        {{! @glint-expect-error }}
        @onChange={{@onChange}}
        @onCreate={{@onCreate}}
        data-test-form-power-select-multiple
        ...attributes
        as |option|
      >
        {{yield option}}
      </PowerSelectWithCreate>
    {{else}}
      <PowerSelect
        @multiple={{true}}
        @options={{@options}}
        @search={{@search}}
        @selected={{@selected}}
        @disabled={{@isDisabled}}
        @placeholder={{@chooseLabel}}
        @searchEnabled={{true}}
        @searchField={{@searchField}}
        @matcher={{@matcher}}
        @allowClear={{@isClearable}}
        @verticalPosition={{@verticalPosition}}
        @triggerId={{@identifier}}
        @onChange={{@onChange}}
        data-test-form-power-select-multiple
        ...attributes
        as |option|
      >
        {{yield option}}
      </PowerSelect>
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
