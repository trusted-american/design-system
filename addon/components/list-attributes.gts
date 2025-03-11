import Component from '@glimmer/component';
import { action } from '@ember/object';
import Button from './button';
import Dropdown from './dropdown';
import DropdownItem from './dropdown/item';
import DropdownDivider from './dropdown/divider';
import dropdown from '../modifiers/dropdown';
import { not, notEq } from 'ember-truth-helpers';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';

import type { Option } from './form/select';

const includes = <T,>(value: T, arr: T[]) => arr.includes(value);

const compare = <T,>(
  a: ListAttributesKey<T>[],
  b: ListAttributesKey<T>[],
): boolean => {
  return [...a].sort().join(',') === [...b].sort().join(',');
};

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

  <template>
    <Button
      @label={{@label}}
      @icon="table-columns"
      {{dropdown autoClose="outside"}}
      ...attributes
    />
    <Dropdown>
      {{#each @presets as |preset|}}
        <DropdownItem
          @label={{preset.label}}
          @icon="check"
          class={{if
            (notEq preset.label this.activePreset.label)
            "invisible-icon"
          }}
          data-test-preset
          {{on "click" (fn @onChange preset.values)}}
        />
      {{/each}}
      <DropdownDivider />
      {{#each @options as |attribute|}}
        <DropdownItem
          @label={{attribute.label}}
          @icon="check"
          class={{if
            (not (includes attribute.value @selected))
            "invisible-icon"
          }}
          data-test-option
          {{on "click" (fn this.toggleAttribute attribute)}}
        />
      {{/each}}
    </Dropdown>
  </template>
}
