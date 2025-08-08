import { on } from '@ember/modifier';
import { action } from '@ember/object';
import Component from '@glimmer/component';
import FormFeedback from './feedback';
import FormHelp from './help';
import type { FormInputArgs } from './input';
import FormLabel from './label';

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
    <div class="space-y-2">
      {{#unless @isInputOnly}}
        <div class="flex items-center space-x-2">
          <FormLabel
            @label={{@label}}
            @identifier={{@identifier}}
            @isRequired={{@isRequired}}
            @requiredLabel={{@requiredLabel}}
          />
        </div>
      {{/unless}}

      <div class="flex items-center space-x-3">
        <input
          type="file"
          id={{@identifier}}
          class="block w-full text-gray-500 border border-gray-300 rounded-lg cursor-pointer file:mr-4 file:py-2 file:px-4 file:rounded-l-lg file:border-0 file:bg-gray-100 file:text-gray-700 file:cursor-pointer hover:file:bg-gray-200"
          required={{@isRequired}}
          aria-label={{if @isInputOnly @label}}
          data-test-form-file-input
          {{on "change" this.change}}
          ...attributes
        />
      </div>

      {{#if @invalidLabel}}
        <div class="text-sm text-red-600">
          <FormFeedback
            @validLabel={{@validLabel}}
            @invalidLabel={{@invalidLabel}}
          />
        </div>
      {{/if}}

      {{#each @errors as |error|}}
        <div class="text-sm text-red-600">
          <FormFeedback
            @validLabel={{undefined}}
            @invalidLabel={{error.message}}
          />
        </div>
      {{/each}}

      {{#if @help}}
        <div class="text-sm text-gray-600">
          <FormHelp @label={{@help}} />
        </div>
      {{/if}}
    </div>
  </template>
}
