import Component from '@glimmer/component';
import { action } from '@ember/object';
import FormLabel from './label';
import FormFeedback from './feedback';
import FormHelp from './help';
import { concat } from '@ember/helper';
import { on } from '@ember/modifier';
import type { FormInputArgs } from './input';

interface Args extends FormInputArgs {
  onChange: (file: File) => void;
}

export interface FormFileInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormFileInput extends Component<FormFileInputSignature> {
  @action
  change(event: Event): void {
    const { target } = event as Event & { target: HTMLInputElement };
    if (!target.files) {
      return;
    }
    const [file] = Array.from(target.files);
    if (file) {
      this.args.onChange(file);
    } else {
      target.value = '';
    }
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

    <input
      type="file"
      id={{@identifier}}
      class="form-control {{if @size (concat 'form-control-' @size)}}"
      required={{@isRequired}}
      aria-label={{if @isInputOnly @label}}
      data-test-form-file-input
      {{on "change" this.change}}
      ...attributes
    />

    <FormFeedback @validLabel={{@validLabel}} @invalidLabel={{@invalidLabel}} />

    {{#each @errors as |error|}}
      <FormFeedback @validLabel={{undefined}} @invalidLabel={{error.message}} />
    {{/each}}

    {{#if @help}}
      <FormHelp @label={{@help}} />
    {{/if}}
  </template>
}
