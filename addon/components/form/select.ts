import Component from '@glimmer/component';
import { action } from '@ember/object';

export interface Option<T = unknown> {
  value: T;
  label: string;
}

interface Args<T> {
  selected: T;
  label: string;
  identifier: string;
  required?: boolean;
  help?: string;
  invalidFeedback?: string;
  inputOnly?: boolean;
  size?: 'sm' | 'lg';
  onChange: (value: T) => void;
}

interface ComplexArgs<T> extends Args<T> {
  options: Option<T>[];
  simple?: undefined;
}

interface SimpleArgs extends Args<string> {
  options: string[];
  simple: true;
}

export interface FormSelectSignature<T> {
  Args: ComplexArgs<T> | SimpleArgs;
  Element: HTMLSelectElement;
}

export default class FormSelect<T> extends Component<FormSelectSignature<T>> {
  @action
  change({ target }: Event): void {
    const index = parseInt((target as HTMLFormElement)['value'] as string);

    const options = this.args.options as Option[];
    const selected = options[index];

    if (selected) {
      this.args.onChange(selected.value as never);
    } else {
      this.args.onChange(options[0]?.value as never);
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Select': typeof FormSelect;
  }
}
