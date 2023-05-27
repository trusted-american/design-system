import Component from '@glimmer/component';

export interface FormHelpComponentSignature {
  Element: HTMLDivElement;
  Args: {
    text?: string;
  };
}

export default class FormHelpComponent extends Component<FormHelpComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Help': typeof FormHelpComponent;
  }
}
