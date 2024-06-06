import Component from '@glimmer/component';

export interface BaseArgs {
  label: string;
  identifier: string;
  isRequired?: boolean;
  help?: string;
  invalidFeedback?: string;
  isInputOnly?: boolean;
}

interface Args extends BaseArgs {
  value: string | null | undefined;
  type?: string;
  size?: 'sm' | 'lg';
  errors?: { message: string }[];
}

export interface FormInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormInput extends Component<FormInputSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Input': typeof FormInput;
  }
}
