import Component from '@glimmer/component';
import { action } from '@ember/object';
import FormLabel from './label';
import FormFeedback from './feedback';
import FormHelp from './help';
import { concat } from '@ember/helper';
import { on } from '@ember/modifier';

import type { FormInputArgs } from './input';

interface Args extends FormInputArgs {
  value: string | null | undefined;
  onChange: (value: string) => void;
}

export interface FormTextareaSignature {
  Args: Args;
  Element: HTMLTextAreaElement;
}

export default class FormTextarea extends Component<FormTextareaSignature> {
  @action
  change({ target }: Event): void {
    if (!(target instanceof HTMLTextAreaElement)) {
      throw new Error();
    }
    this.args.onChange(target.value);
  }

  <template>
    {{#unless @isInputOnly}}
      <FormLabel
        @label={{@label}}
        @identifier={{@identifier}}
        @isRequired={{@isRequired}}
        @requiredLabel={{@requiredLabel}}
      />
    {{/unless}}

    <textarea
      id={{@identifier}}
      value={{@value}}
      class="form-control {{if @size (concat 'form-control-' @size)}}"
      required={{@isRequired}}
      aria-label={{if @isInputOnly @label}}
      data-test-form-textarea
      {{on "input" this.change}}
      ...attributes
    />

    {{#if @invalidFeedback}}
      <FormFeedback
        @validLabel={{@validLabel}}
        @invalidLabel={{@invalidFeedback}}
      />
    {{/if}}

    {{#each @errors as |error|}}
      <FormFeedback
        @validLabel={{@validLabel}}
        @invalidLabel={{error.message}}
      />
    {{/each}}

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
