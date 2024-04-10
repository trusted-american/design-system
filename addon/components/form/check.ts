import Component from '@glimmer/component';

export interface FormCheckSignature {
  Args: {
    value: boolean | undefined;
    label: string;
    identifier: string;
    required?: boolean;
    help?: string;
    inputOnly?: boolean;
    inline?: boolean;
    switch?: boolean;
    isHelpTooltip?: boolean;
  };
  Element: HTMLInputElement;
}

export default class FormCheck extends Component<FormCheckSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check': typeof FormCheck;
  }
}
