import Component from '@glimmer/component';

export interface FormRadioInputSignature {
  Args: {
    checked: boolean;
    name: string;
    identifier: string;
    required?: boolean;
  };
  Element: HTMLInputElement;
}

export default class FormRadioInput extends Component<FormRadioInputSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Radio::Input': typeof FormRadioInput;
  }
}
