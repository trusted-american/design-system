import Component from '@glimmer/component';

export interface FormCheckComponentSignature {
  Element: HTMLInputElement;
  Args: {
    value: boolean | null | undefined | unknown;
    label: string;
    identifier: string;
    inline?: boolean;
    switch?: boolean;
    help?: string;
    helpTooltip?: string;
  };
}

export default class FormCheckComponent extends Component<FormCheckComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check': typeof FormCheckComponent;
  }
}
