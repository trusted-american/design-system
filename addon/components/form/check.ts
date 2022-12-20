import Component from '@glimmer/component';

export interface FormCheckComponentSignature {
  Element: HTMLInputElement;
  Args: {
    value: boolean;
    label: string;
    identifier: string;
    inline?: boolean;
    switch?: boolean;
    help?: string;
    helpTooltip?: string;
  };
}

export default class FormCheckComponent extends Component<FormCheckComponentSignature> {}
