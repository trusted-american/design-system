import Component from '@glimmer/component';
import Icon from '../icon';

export interface FormFeedbackSignature {
  Args: {
    label?: string;
  };
  Element: HTMLDivElement;
}

export default class FormFeedback extends Component<FormFeedbackSignature> {
  <template>
    {{#if @label}}
      <div class="invalid-feedback" data-test-form-error ...attributes>
        <Icon @icon="triangle-exclamation" class="me-1" />
        {{@label}}
      </div>
      <div class="valid-feedback">
        <Icon @icon="check" class="me-1" />
        Looks good!
      </div>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Feedback': typeof FormFeedback;
  }
}
