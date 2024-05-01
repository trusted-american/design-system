import Component from '@glimmer/component';

import type { BaseArgs } from './input';
import type { Option } from '@trusted-american/design-system/components/form/select';

interface Args<T> extends BaseArgs {
  options: Option<T>[];
  selected?: T | null;
  inline?: boolean;
  onChange: (selected: T) => void;
}

export interface FormRadioSignature<T> {
  Args: Args<T>;
  Element: HTMLElement;
}

export default class FormRadio<T> extends Component<FormRadioSignature<T>> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Radio': typeof FormRadio;
  }
}
