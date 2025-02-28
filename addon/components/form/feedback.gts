import Icon from '../icon';

import type { TOC } from '@ember/component/template-only';

export interface FormFeedbackSignature {
  Args: {
    label: string;
  };
  Element: HTMLDivElement;
}

const FormFeedback: TOC<FormFeedbackSignature> = <template>
  <div class="invalid-feedback" data-test-form-error ...attributes>
    <Icon @icon="triangle-exclamation" class="me-1" />
    {{@label}}
  </div>
  <div class="valid-feedback">
    <Icon @icon="check" class="me-1" />
    Looks good!
  </div>
</template>;

export default FormFeedback;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Feedback': typeof FormFeedback;
  }
}
