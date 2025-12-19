import type { TOC } from '@ember/component/template-only';
import { concat, fn } from '@ember/helper';
import { on } from '@ember/modifier';
import FormFeedback from './feedback';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';

const getEventValue = (fn: (value: string) => void, { target }: Event) => {
  if (!(target instanceof HTMLTextAreaElement)) {
    throw new Error();
  }
  fn(target.value);
};

interface Args extends FormInputArgs {
  value: string | null | undefined;
  onChange: (value: string) => void;
}

export interface FormTextareaSignature {
  Args: Args;
  Element: HTMLTextAreaElement;
}

<template>
  {{#unless @isInputOnly}}
    <FormLabel
      @label={{@label}}
      @for={{@id}}
      @isRequired={{@isRequired}}
      @requiredLabel={{@requiredLabel}}
    />
  {{/unless}}

  <textarea
    id={{@id}}
    value={{@value}}
    class="form-control {{if @size (concat 'form-control-' @size)}}"
    required={{@isRequired}}
    aria-label={{if @isInputOnly @label}}
    data-test-form-textarea
    {{on "input" (fn getEventValue @onChange)}}
    ...attributes
  />

  <FormFeedback @validLabel={{@validLabel}} @invalidLabel={{@invalidLabel}} />

  {{#each @errors as |error|}}
    <FormFeedback @validLabel={{undefined}} @invalidLabel={{error.message}} />
  {{/each}}

  {{#if @help}}
    <FormHelp @label={{@help}} />
  {{/if}}
</template> satisfies TOC<FormTextareaSignature>;
