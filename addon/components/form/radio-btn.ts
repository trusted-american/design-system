import Component from '@glimmer/component';

import type { Option } from '@trusted-american/design-system/components/form/select';

export interface FormRadioBtnComponentSignature<T> {
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

export default class FormRadioBtnComponent<T> extends Component<
  FormRadioBtnComponentSignature<T>
> {}

// declare module '@glint/environment-ember-loose/registry' {
//   export default interface Registry {
//     'Form::RadioBtn': typeof FormRadioBtnComponent;
//   }
// }
