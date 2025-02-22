import Component from '@glimmer/component';

import type { BaseArgs } from './input';
import type { Group as _Group } from 'ember-power-select/utils/group-utils';

export interface Group<T> extends _Group {
  options: T[];
}

interface Args<T> extends BaseArgs {
  options?: (T | Group<T>)[];
  selected: T | null | undefined;
  search?: (query: string) => T[];
  searchField?: keyof T & string;
  matcher?: (value: T, query: string) => number;
  isClearable?: boolean;
  isDisabled?: boolean;
  verticalPosition?: 'auto' | 'above' | 'below';
  chooseLabel: string;
  searchLabel: string;
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
