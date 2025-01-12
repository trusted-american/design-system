import Component from '@glimmer/component';

import type { BaseArgs } from './input';
import type { Group } from 'ember-power-select/utils/group-utils';

export type { Group };

interface Args<T> extends BaseArgs {
  options?: (T | Group)[];
  selected: T | null | undefined;
  disabled?: boolean;
  search?: (query: string) => T[];
  searchField?: keyof T & string;
  matcher?: (record: T, query: string) => number;
  allowClear?: boolean;
  verticalPosition?: string;
  chooseText: string;
  searchText: string;
  onChange: (selected: T) => void;
  onCreate?: (query: string) => void;
}

export interface FormPowerSelectSignature<T> {
  Args: Args<T>;
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
