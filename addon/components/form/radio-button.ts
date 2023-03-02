import Component from '@glimmer/component';

import type { Option } from '@trusted-american/design-system/components/form/select';

export interface FormRadioButtonComponentSignature<T> {
  Element: HTMLDivElement;
  Args: {
    options: Option<T>[];
    selected: T;
    identifier: string;
    size?: 'sm' | 'lg';
    color?: string;
    onChange: (selected: T) => void;
  };
}

export default class FormRadioButtonComponent<T> extends Component<
  FormRadioButtonComponentSignature<T>
> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::RadioButton': typeof FormRadioButtonComponent;
  }
}
