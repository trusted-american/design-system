import type { TOC } from '@ember/component/template-only';
import {
  faCheck,
  faTriangleExclamation,
} from '@fortawesome/free-solid-svg-icons';
import Icon from '../icon';

export interface FormFeedbackSignature {
  Args: {
    validLabel: string | undefined;
    invalidLabel: string | undefined;
  };
  Element: HTMLDivElement;
}

const FormFeedback: TOC<FormFeedbackSignature> = <template>
  {{#if @invalidLabel}}
    <div class="invalid-feedback" data-test-form-feedback ...attributes>
      <Icon @icon={{faTriangleExclamation}} class="me-1" />
      {{@invalidLabel}}
    </div>
  {{/if}}
  {{#if @validLabel}}
    <div class="valid-feedback">
      <Icon @icon={{faCheck}} class="me-1" />
      {{@validLabel}}
    </div>
  {{/if}}
</template>;

export default FormFeedback;
