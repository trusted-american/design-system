import Component from '@glimmer/component';

export interface FormFeedbackSignature {
  Args: {
    text?: string;
  };
  Element: HTMLDivElement;
}

export default class FormFeedback extends Component<FormFeedbackSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Feedback': typeof FormFeedback;
  }
}
