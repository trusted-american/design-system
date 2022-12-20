import Component from '@glimmer/component';

export interface FormInputComponentSignature {
  Element: HTMLInputElement;
  Args: {
    value: string;
    type: string;
    label: string;
    help: string;
    invalidFeedback: string;
    identifier: string;
    required: boolean;
  };
}

export default class FormInputComponent extends Component<FormInputComponentSignature> {}
