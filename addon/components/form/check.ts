import Component from '@glimmer/component';

export interface FormCheckSignature {
  Element: HTMLInputElement;
  Args: {
    value: boolean | null | undefined | unknown;
    label?: string;
    identifier: string;
    inline?: boolean;
    switch?: boolean;
    help?: string;
    helpTooltip?: string;
  };
}

export default class FormCheck extends Component<FormCheckSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check': typeof FormCheck;
  }
}
