import Component from '@glimmer/component';

import type { BaseArgs } from './input';

interface Args<T> extends BaseArgs {
  options: T[];
  selected: T[];
  disabled?: boolean;
  placeholder?: string;
  renderInPlace?: boolean;
  searchEnabled?: boolean;
  searchField?: string;
  chooseLabel: string;
  onChange: (selected: T[]) => void;
  onCreate?: (query: string) => void;
}

export interface FormPowerSelectMultipleSignature<T> {
  Args: Args<T>;
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}

export default class FormPowerSelectMultiple<T> extends Component<
  FormPowerSelectMultipleSignature<T>
> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::PowerSelectMultiple': typeof FormPowerSelectMultiple;
  }
}
