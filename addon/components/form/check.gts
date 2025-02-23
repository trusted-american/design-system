import FormCheckInput from './check/input';
import FormLabel from './label';
import FormFeedback from './feedback';
import FormHelp from './help';

import type { TOC } from '@ember/component/template-only';
import type { BaseArgs } from './input';

interface Args extends BaseArgs {
  value: boolean | null | undefined;
  isInline?: boolean;
  isSwitch?: boolean;
  onChange: (value: boolean) => void;
}

export interface FormCheckSignature {
  Args: Args;
  Element: HTMLInputElement;
}

const FormCheck: TOC<FormCheckSignature> = <template>
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
      @identifier={{@identifier}}
      @isRequired={{@isRequired}}
      @isInputOnly={{@isInputOnly}}
      @onChange={{@onChange}}
      ...attributes
    />

    <FormLabel
      @label={{unless @isInputOnly @label}}
      @identifier={{@identifier}}
      @isRequired={{@isRequired}}
      @isCheck={{true}}
    />

    <FormFeedback @label={{@invalidFeedback}} />
    <FormHelp @label={{@help}} />
  </div>
</template>;

export default FormCheck;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check': typeof FormCheck;
  }
}
