import Component from '@glimmer/component';

export interface FormErrorComponentSignature {
  Element: HTMLDivElement;
  Args: {
    text?: string;
  };
}

export default class FormErrorComponent extends Component<FormErrorComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Error': typeof FormErrorComponent;
  }
}
