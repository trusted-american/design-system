import Component from '@glimmer/component';

export interface FormInputSignature {
  Args: {
    value: string | number | null | undefined | unknown;
    type?: string;
    label: string;
    identifier: string;
    required?: boolean;
    help?: string;
    invalidFeedback?: string;
    inputOnly?: boolean;
    size?: 'sm' | 'lg';
    errors?: { message: string }[];
  };
  Element: HTMLInputElement;
}

export default class FormInput extends Component<FormInputSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Input': typeof FormInput;
  }
}
