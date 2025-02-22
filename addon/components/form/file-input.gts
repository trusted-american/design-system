import Component from '@glimmer/component';
import { action } from '@ember/object';
import FormLabel from './label';
import FormFeedback from './feedback';
import FormHelp from './help';
import { concat } from '@ember/helper';
import { on } from '@ember/modifier';

import type { BaseArgs } from './input';

interface Args extends BaseArgs {
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
    <FormLabel
      @label={{unless @isInputOnly @label}}
      @identifier={{@identifier}}
      @isRequired={{@isRequired}}
    />

    <input
      type="file"
      id={{@identifier}}
      class="form-control {{if @size (concat 'form-control-' @size)}}"
      required={{@isRequired}}
      aria-label={{if @isInputOnly @label}}
      {{on "change" this.change}}
      ...attributes
    />

    <FormFeedback @label={{@invalidFeedback}} />

    {{#each @errors as |error|}}
      <FormFeedback @label={{error.message}} />
    {{/each}}

    <FormHelp @label={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::FileInput': typeof FormFileInput;
  }
}
