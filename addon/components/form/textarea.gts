import Component from '@glimmer/component';
import { action } from '@ember/object';
import FormLabel from './label';
import FormFeedback from './feedback';
import FormHelp from './help';
import { concat } from '@ember/helper';
import { on } from '@ember/modifier';

import type { BaseArgs } from './input';

interface Args extends BaseArgs {
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
    <FormLabel
      @label={{unless @isInputOnly @label}}
      @identifier={{@identifier}}
      @isRequired={{@isRequired}}
    />

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

    <FormFeedback @label={{@invalidFeedback}} />

    {{#each @errors as |error|}}
      <FormFeedback @label={{error.message}} />
    {{/each}}

    <FormHelp @label={{@help}} />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Textarea': typeof FormTextarea;
  }
}
