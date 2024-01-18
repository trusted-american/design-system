import Component from '@glimmer/component';

export interface FormCheckSignature {
  Args: {
    value: unknown; // boolean | null | undefined | unknown;
    label?: string;
    identifier: string;
    required?: boolean;
    inline?: boolean;
    switch?: boolean;
    help?: string;
    helpTooltip?: string;
  };
  Element: HTMLInputElement;
}

export default class FormCheck extends Component<FormCheckSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check': typeof FormCheck;
  }
}
