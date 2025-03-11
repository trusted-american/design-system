import Component from '@glimmer/component';
import FormFeedback from './feedback';
import FormHelp from './help';
import FormLabel from './label';
import PowerSelect from 'ember-power-select/components/power-select';
import PowerSelectWithCreate from 'ember-power-select-with-create/components/power-select-with-create';

import type { FormInputArgs } from './input';
import type { Group as _Group } from 'ember-power-select/utils/group-utils';

export interface Group<T> extends _Group {
  options: T[];
}

interface Args<T> extends FormInputArgs {
  options?: (T | Group<T>)[];
  selected: T | null | undefined;
  search?: (query: string) => T[];
  searchField?: keyof T & string;
  matcher?: (value: T, query: string) => number;
  isClearable?: boolean;
  isDisabled?: boolean;
  verticalPosition?: 'auto' | 'above' | 'below';
  chooseLabel: string;
  searchLabel: string;
  onChange: (selected: T) => void;
  onCreate?: (query: string) => void;
}

export interface FormPowerSelectSignature<T> {
  Args: Args<T>;
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}

export default class FormPowerSelect<T> extends Component<
  FormPowerSelectSignature<T>
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

    {{! hidden input for validation }}
    <input
      value="{{@selected}}"
      type="text"
      required={{@isRequired}}
      class="d-none"
      aria-label={{@label}}
    />

    {{#if @onCreate}}
      <PowerSelectWithCreate
        @options={{@options}}
        @search={{@search}}
        @selected={{@selected}}
        @disabled={{@isDisabled}}
        @placeholder={{@chooseLabel}}
        @renderInPlace={{true}}
        @searchEnabled={{true}}
        @searchField={{@searchField}}
        @searchPlaceholder={{@searchLabel}}
        @matcher={{@matcher}}
        @allowClear={{@isClearable}}
        @verticalPosition={{@verticalPosition}}
        @showCreatePosition="bottom"
        @onChange={{@onChange}}
        @onCreate={{@onCreate}}
        id={{@identifier}}
        data-test-form-power-select
        ...attributes
        as |option|
      >
        {{yield option}}
      </PowerSelectWithCreate>
    {{else}}
      <PowerSelect
        @options={{@options}}
        @search={{@search}}
        @selected={{@selected}}
        @disabled={{@isDisabled}}
        @placeholder={{@chooseLabel}}
        @renderInPlace={{true}}
        @searchEnabled={{true}}
        @searchField={{@searchField}}
        @searchPlaceholder={{@searchLabel}}
        @matcher={{@matcher}}
        @allowClear={{@isClearable}}
        @verticalPosition={{@verticalPosition}}
        @triggerId={{@identifier}}
        @onChange={{@onChange}}
        data-test-form-power-select
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
