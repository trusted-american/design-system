import Component from '@glimmer/component';

export interface FormErrorSignature {
  Element: HTMLDivElement;
  Args: {
    text?: string;
  };
}

export default class FormError extends Component<FormErrorSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Error': typeof FormError;
  }
}
