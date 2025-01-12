import Component from '@glimmer/component';

import type { Group } from 'ember-power-select/utils/group-utils';

export interface FormPowerSelectSignature<T> {
  Args: {
    options?: (T | Group)[];
    selected: T | null | undefined;
    label?: string;
    identifier: string;
    isRequired?: boolean;
    help?: string;
    invalidFeedback?: string;
    isInputOnly?: boolean;
    disabled?: boolean;
    search?: (query: string) => T[];
    searchField?: string;
    matcher?: (record: T, query: string) => number;
    allowClear?: boolean;
    verticalPosition?: string;
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
