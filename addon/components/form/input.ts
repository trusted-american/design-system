import Component from '@glimmer/component';

export interface FormInputComponentSignature {
  Element: HTMLInputElement;
  Args: {
    value: string | number | null | undefined | unknown;
    size?: 'sm' | 'lg';
    type?: string;
    label?: string;
    identifier: string;
    required?: boolean;
    help?: string;
    invalidFeedback?: string;
    errors?: { message: string }[];
  };
}

export default class FormInputComponent extends Component<FormInputComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Input': typeof FormInputComponent;
  }
}
