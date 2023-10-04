import Component from '@glimmer/component';

export interface FormInputSignature {
  Args: {
    value: string | number | null | undefined | unknown;
    size?: 'sm' | 'lg';
    type?: string;
    label: string;
    identifier: string;
    required?: boolean;
    help?: string;
    invalidFeedback?: string;
    errors?: { message: string }[];
    inputOnly?: boolean;
  };
  Element: HTMLInputElement;
}

export default class FormInput extends Component<FormInputSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Input': typeof FormInput;
  }
}
