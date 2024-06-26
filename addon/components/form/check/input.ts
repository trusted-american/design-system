import Component from '@glimmer/component';

export interface FormCheckInputSignature {
  Args: {
    value: boolean | undefined;
    label: string;
    identifier: string;
    isRequired?: boolean;
    isInputOnly?: boolean;
  };
  Element: HTMLInputElement;
}

export default class FormCheckInput extends Component<FormCheckInputSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check::Input': typeof FormCheckInput;
  }
}
