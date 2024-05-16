import Component from '@glimmer/component';

import type { BaseArgs } from './input';
import type { RadioOption } from './radio';

interface RadioCardOption<T> extends RadioOption<T> {
  imgUrl?: string;
  icon?: string;
}

interface Args<T> extends BaseArgs {
  options: RadioCardOption<T>[];
  selected: T | null | undefined;
  inputOnly?: boolean;
  onChange: (selected: T) => void;
}

export interface FormRadioCardSignature<T> {
  Args: Args<T>;
  Element: HTMLDivElement;
}

export default class FormRadioCard<T> extends Component<
  FormRadioCardSignature<T>
> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::RadioCard': typeof FormRadioCard;
  }
}
