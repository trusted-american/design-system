import Component from '@glimmer/component';

import type { Group } from 'ember-power-select/addon/utils/group-utils';

interface FormPowerSelectSignature<T> {
  Args: {
    options?: (T | Group)[];
    selected: T | null | undefined;
    label?: string;
    identifier: string;
    required?: boolean;
    disabled?: boolean;
    search?: (query: string) => T[];
    searchField?: string;
    allowClear?: boolean;
    help?: string;
    onChange: (selected: never) => void;
    onCreate?: (query: string) => void;
  };
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}

export default class FormPowerSelect<T> extends Component<
  FormPowerSelectSignature<T>
> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::PowerSelect': typeof FormPowerSelect;
  }
}
