import { action } from '@ember/object';
import Component from '@glimmer/component';

interface FormNumberInputSignature {
  Args: {
    value: number | null | undefined;
    type?: string;
    label: string;
    identifier: string;
    required?: boolean;
    help?: string;
    invalidFeedback?: string;
    inputOnly?: boolean;
    size?: 'sm' | 'lg';
    onChange: (value: number | null) => void;
  };
  Element: HTMLInputElement;
}

export default class FormNumberInput extends Component<FormNumberInputSignature> {
  get value(): string | undefined {
    return this.args.value?.toString();
  }

  @action
  change({ target }: Event) {
    const { value } = target as HTMLInputElement;
    const number =
      value === '' || isNaN(value as unknown as number)
        ? null
        : parseInt(value);
    this.args.onChange(number);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::NumberInput': typeof FormNumberInput;
  }
}
