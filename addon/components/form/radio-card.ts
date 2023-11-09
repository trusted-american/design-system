import Component from '@glimmer/component';

import { Option } from '@trusted-american/design-system/components/form/select';

interface RadioCardOption<T> extends Option<T> {
  imgUrl?: string;
  icon?: string;
  help?: string;
}

export interface FormRadioCardSignature<T> {
  Element: HTMLDivElement;
  Args: {
    options: RadioCardOption<T>[];
    selected?: T | null;
    label: string;
    identifier: string;
    required?: boolean;
    inputOnly?: boolean;
    onChange: (selected: T) => void;
  };
}

export default class FormRadioCard<T> extends Component<
  FormRadioCardSignature<T>
> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::RadioCard': typeof FormRadioCard;
  }
}
