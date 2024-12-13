import Component from '@glimmer/component';

import type { BaseArgs } from './input';

interface Args extends BaseArgs {
  value: boolean | undefined;
  isInline?: boolean;
  isSwitch?: boolean;
  onChange: (value: boolean) => void;
}

export interface FormCheckSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormCheck extends Component<FormCheckSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Check': typeof FormCheck;
  }
}
