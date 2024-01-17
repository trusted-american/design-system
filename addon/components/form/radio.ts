import Component from '@glimmer/component';

import type { Option } from '@trusted-american/design-system/components/form/select';

export interface FormRadioSignature<T> {
  Args: {
    options: Option<T>[];
    selected?: T | null;
    inline?: boolean;
    label?: string;
    identifier: string;
    required?: boolean;
    invalidFeedback?: string;
    onChange: (selected: T) => void;
  };
  Element: HTMLElement;
}

export default class FormRadio<T> extends Component<FormRadioSignature<T>> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Radio': typeof FormRadio;
  }
}
