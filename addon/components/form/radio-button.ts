import Component from '@glimmer/component';

import type { BaseArgs } from './input';
import type { Option } from '@trusted-american/design-system/components/form/select';

interface RadioOption<T> extends Option<T> {
  color?: string;
}

interface Args<T> extends BaseArgs {
  options: RadioOption<T>[];
  selected: T;
  onChange: (selected: T) => void;
}

export interface FormRadioButtonSignature<T> {
  Args: Args<T>;
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
