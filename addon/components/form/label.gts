import Badge from '../badge';

import type { TOC } from '@ember/component/template-only';

export interface FormLabelSignature {
  Args: {
    label: string;
    identifier: string;
    isRequired?: boolean;
    isCheck?: boolean;
  };
  Element: HTMLLabelElement;
}

const FormLabel: TOC<FormLabelSignature> = <template>
  <label
    for={{@identifier}}
    class={{if @isCheck "form-check-label" "form-label"}}
    data-test-form-label
    ...attributes
  >
    {{@label}}
    {{#if @isRequired}}
      {{! TODO: string }}
      <Badge @label="Required" @color="light" class="ms-1" />
    {{/if}}
  </label>
</template>;

export default FormLabel;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Label': typeof FormLabel;
  }
}
