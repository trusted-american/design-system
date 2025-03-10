import Icon from '../icon';

import type { TOC } from '@ember/component/template-only';

export interface FormFeedbackSignature {
  Args: {
    invalidLabel: string;
    validLabel: string | undefined;
  };
  Element: HTMLDivElement;
}

const FormFeedback: TOC<FormFeedbackSignature> = <template>
  <div class="invalid-feedback" data-test-form-error ...attributes>
    <Icon @icon="triangle-exclamation" class="me-1" />
    {{@invalidLabel}}
  </div>
  <div class="valid-feedback">
    <Icon @icon="check" class="me-1" />
    {{@validLabel}}
  </div>
</template>;

export default FormFeedback;
