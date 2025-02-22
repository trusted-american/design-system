import Component from '@glimmer/component';
import { action } from '@ember/object';

import type { BaseArgs } from './input';

export interface Option<T> {
  value: T;
  label: string;
}

interface Group<T> {
  groupLabel: string;
  options: Option<T>[];
}

interface Args<T> extends BaseArgs {
  options: (T | Option<T> | Group<T>)[];
  selected: T;
  chooseLabel?: string;
  onChange: (value: T) => void;
}

export interface FormSelectSignature<T> {
  Args: Args<T>;
  Element: HTMLSelectElement;
}

export default class FormSelect<T> extends Component<FormSelectSignature<T>> {
  @action
  change({ target }: Event): void {
    if (!(target instanceof HTMLSelectElement)) {
      throw new Error();
    }

    const options = this.args.options;

    const index = parseInt(target.value);
    let selected = options[index] ?? null;

    if (target.value.includes('-')) {
      const [optIndex, subOptIndex] = target.value.split('-');
      if (optIndex && subOptIndex) {
        selected = (options as Group<T>[])[parseInt(optIndex)]?.options[
          parseInt(subOptIndex)
        ]!;
      }
    }

    if (selected && typeof selected === 'object' && 'groupLabel' in selected) {
      const [firstOption] = selected.options;
      if (firstOption) {
        this.args.onChange(firstOption.value);
      }
    } else if (
      selected &&
      typeof selected === 'object' &&
      'label' in selected
    ) {
      this.args.onChange(selected.value);
    } else {
      this.args.onChange(selected as T);
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Form::Select': typeof FormSelect;
  }
}
