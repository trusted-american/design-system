import Component from '@glimmer/component';

import type { Option } from '@trusted-american/design-system/components/form/select';

export interface FormRadioButtonSignature<T> {
  Args: {
    options: Option<T>[];
    selected: T;
    identifier: string;
    size?: 'sm' | 'lg';
    color?: string;
    onChange: (selected: T) => void;
  };
  Element: HTMLDivElement;
}

export default class FormRadioButton<T> extends Component<
  FormRadioButtonSignature<T>
> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::RadioButton': typeof FormRadioButton;
  }
}
