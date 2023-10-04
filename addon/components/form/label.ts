import Component from '@glimmer/component';

export interface FormLabelSignature {
  Args: {
    text?: string;
    identifier: string;
    required?: unknown;
  };
  Element: HTMLInputElement;
}

export default class FormLabel extends Component<FormLabelSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Label': typeof FormLabel;
  }
}
