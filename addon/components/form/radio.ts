import Component from '@glimmer/component';

import { Option } from '@trusted-american/design-system/components/form/select';

export interface FormRadioComponentSignature<T> {
  Element: HTMLElement;
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
}

export default class FormRadioComponent<T> extends Component<
  FormRadioComponentSignature<T>
> {}

// declare module '@glint/environment-ember-loose/registry' {
//   export default interface Registry {
//     'Form::Radio': typeof FormRadioComponent;
//   }
// }
