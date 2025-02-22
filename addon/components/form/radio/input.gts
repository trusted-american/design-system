import type { TOC } from '@ember/component/template-only';

export interface FormRadioInputSignature {
  Args: {
    checked: boolean;
    name: string;
    identifier: string;
    isRequired?: boolean;
  };
  Element: HTMLInputElement;
}

const FormRadioInput: TOC<FormRadioInputSignature> = <template>
  <input
    type="radio"
    class="form-check-input"
    name={{@name}}
    id={{@identifier}}
    checked={{@checked}}
    required={{@isRequired}}
    ...attributes
  />
</template>;

export default FormRadioInput;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Radio::Input': typeof FormRadioInput;
  }
}
