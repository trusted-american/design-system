import Component from '@glimmer/component';
import { action } from '@ember/object';

import type { BaseArgs } from './input';

export interface OptGroup<T> {
  groupName: string;
  options: Option<T>[];
}

export interface Option<T> {
  value: T;
  label: string;
}

interface Args<T> extends BaseArgs {
  selected: T;
  size?: 'sm' | 'lg';
  onChange: (value: T) => void;
}

export interface ComplexArgs<T> extends Args<T> {
  options: (Option<T> | OptGroup<T>)[];
  isSimple?: undefined;
}

interface SimpleArgs<T> extends Args<T> {
  options: T[];
  isSimple: true;
}

export interface FormSelectSignature<T> {
  Args: ComplexArgs<T> | SimpleArgs<T>;
  Element: HTMLSelectElement;
}

export default class FormSelect<T> extends Component<FormSelectSignature<T>> {
  @action
  change({ target }: Event): void {
    const options = this.args.options;
    let selected;

    // eslint-disable-next-line @typescript-eslint/no-unsafe-call, @typescript-eslint/no-unsafe-member-access
    if ((target as HTMLFormElement)['value'].indexOf('-') > -1) {
      // eslint-disable-next-line @typescript-eslint/no-unsafe-assignment, @typescript-eslint/no-unsafe-call, @typescript-eslint/no-unsafe-member-access
      const parts = (target as HTMLFormElement)['value'].split('-');
      const index1 = parseInt(parts[0] as string);
      const index2 = parseInt(parts[1] as string);
      selected = options[index1].options[index2] as Option<T>;
    } else {
      const index = parseInt((target as HTMLFormElement)['value'] as string);
      selected = options[index] as Option<T>;
    }

    if (selected) {
      this.args.onChange(selected.value);
    } else {
      const [firstOption] = options;
      if (firstOption) {
        this.args.onChange(firstOption.value);
      }
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Select': typeof FormSelect;
  }
}
