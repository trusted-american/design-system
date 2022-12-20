import Component from '@glimmer/component';

export interface FormTextareaComponentSignature {
  Element: HTMLTextAreaElement;
  Args: {
    value: unknown;
    label?: string;
    identifier: string;
    required?: boolean;
  };
}

export default class FormTextareaComponent extends Component<FormTextareaComponentSignature> {}
