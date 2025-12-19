import type { TOC } from '@ember/component/template-only';
import FormCheckInput from './check/input';
import FormFeedback from './feedback';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';

interface Args extends FormInputArgs {
  value: boolean | null | undefined;
  isInline?: boolean;
  isSwitch?: boolean;
  onChange: (value: boolean) => void;
}

export interface FormCheckSignature {
  Args: Args;
  Element: HTMLInputElement;
}

<template>
  <div
    class="form-check
      {{if @isInline 'form-check-inline'}}
      {{if @isSwitch 'form-switch'}}
      mb-0"
    data-test-form-check
  >
    <FormCheckInput
      @value={{@value}}
      @label={{@label}}
      @id={{@id}}
      @isRequired={{@isRequired}}
      @isInputOnly={{@isInputOnly}}
      @onChange={{@onChange}}
      ...attributes
    />

    {{#unless @isInputOnly}}
      <FormLabel
        @label={{@label}}
        @for={{@id}}
        @isRequired={{@isRequired}}
        @requiredLabel={{@requiredLabel}}
        @isCheck={{true}}
      />
    {{/unless}}

    <FormFeedback @validLabel={{@validLabel}} @invalidLabel={{@invalidLabel}} />

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </div>
</template> satisfies TOC<FormCheckSignature>;
