import Component from '@glimmer/component';
import { action } from '@ember/object';

import type { Option } from '@trusted-american/design-system/components/form/select';

export type ListAttributesKey<T> = keyof T | `${keyof T & string}.${string}`;

export interface ListAttributesPreset<T> {
  label: string;
  values: ListAttributesKey<T>[];
}

export interface ListAttributesSignature<T> {
  Args: {
    presets: ListAttributesPreset<T>[];
    options: Option<ListAttributesKey<T>>[];
    selected: ListAttributesKey<T>[];
    label: string;
    onChange: (selected: ListAttributesKey<T>[]) => void;
  };
  Element: HTMLElement;
}

/**
 * Used for controlling the currently displayed columns of a table.
 */
export default class ListAttributes<T> extends Component<
  ListAttributesSignature<T>
> {
  get activePreset(): ListAttributesPreset<T> | undefined {
    const { presets, selected } = this.args;
    return presets.find(({ values }) => this.compare(values, selected));
  }

  compare(a: ListAttributesKey<T>[], b: ListAttributesKey<T>[]): boolean {
    return [...a].sort().join(',') === [...b].sort().join(',');
  }

  @action
  toggleAttribute(option: Option<ListAttributesKey<T>>): void {
    let selected = [...this.args.selected];

    if (selected.includes(option.value)) {
      selected = selected.filter((value) => value !== option.value);
    } else {
      selected = [...selected, option.value];
    }

    this.args.onChange(selected);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListAttributes: typeof ListAttributes;
  }
}
