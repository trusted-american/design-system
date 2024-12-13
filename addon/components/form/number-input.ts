import { action } from '@ember/object';
import Component from '@glimmer/component';

import type { BaseArgs } from './input';

interface Args extends BaseArgs {
  value: number | null | undefined;
  size?: 'sm' | 'lg';
  isRange?: boolean;
  onChange: (value: number | null) => void;
}

export interface FormNumberInputSignature {
  Args: Args;
  Element: HTMLInputElement;
}

export default class FormNumberInput extends Component<FormNumberInputSignature> {
  get value(): string | undefined {
    return this.args.value?.toString();
  }

  @action
  change(value: string): void {
    const number =
      value === '' || isNaN(value as unknown as number)
        ? null
        : parseFloat(value);
    this.args.onChange(number);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::NumberInput': typeof FormNumberInput;
  }
}
