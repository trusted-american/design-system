import type { TOC } from '@ember/component/template-only';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { eq } from 'ember-truth-helpers';
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

const FormTextarea: TOC<FormTextareaSignature> = <template>
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
    class="block w-full border border-gray-300 rounded-lg bg-gray-50 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors duration-200 ease-in-out
      {{if
        (eq @size 'sm')
        'px-2 py-1 text-sm'
        (if (eq @size 'lg') 'px-4 py-3 text-lg' 'px-3 py-2 text-base')
      }}"
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
</template>;

export default FormTextarea;
