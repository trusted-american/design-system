import Badge from '../badge';

import type { TOC } from '@ember/component/template-only';

export interface FormLabelSignature {
  Args: {
    label?: string;
    identifier: string;
    isRequired?: boolean;
    isCheck?: boolean;
  };
  Element: HTMLLabelElement;
}

const FormLabel: TOC<FormLabelSignature> = <template>
  {{#if @label}}
    <label
      for={{@identifier}}
      class={{if @isCheck "form-check-label" "form-label"}}
      data-test-form-label
      ...attributes
    >
      {{@label}}
      {{#if @isRequired}}
        <Badge @label="Required" @color="light" class="ms-1" />
      {{/if}}
    </label>
  {{/if}}
</template>;

export default FormLabel;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Label': typeof FormLabel;
  }
}
