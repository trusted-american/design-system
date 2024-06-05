import Component from '@glimmer/component';

import type { BaseArgs } from './input';
import type { Option } from '@trusted-american/design-system/components/form/select';

export interface RadioOption<T> extends Option<T> {
  help?: string;
}

interface Args<T> extends BaseArgs {
  options: RadioOption<T>[];
  selected: T | null | undefined;
  isInline?: boolean;
  onChange: (selected: T) => void;
}

export interface FormRadioSignature<T> {
  Args: Args<T>;
  Element: HTMLInputElement;
}

export default class FormRadio<T> extends Component<FormRadioSignature<T>> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Radio': typeof FormRadio;
  }
}
