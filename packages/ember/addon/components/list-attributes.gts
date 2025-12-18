import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { faCheck, faTableColumns } from '@fortawesome/free-solid-svg-icons';
import Component from '@glimmer/component';
import { not, notEq } from 'ember-truth-helpers';
import dropdown from '../modifiers/dropdown';
import Button from './button';
import Dropdown from './dropdown';
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
    return presets.find(({ values }) => compare(values, selected));
  }

  toggleAttribute = (option: Option<ListAttributesKey<T>>) => {
    let selected = [...this.args.selected];

    if (selected.includes(option.value)) {
      selected = selected.filter((value) => value !== option.value);
    } else {
      selected = [...selected, option.value];
    }

    this.args.onChange(selected);
  };

  <template>
    <Button
      @label={{@label}}
      @icon={{faTableColumns}}
      {{dropdown autoClose="outside"}}
      ...attributes
    />
    <Dropdown as |dropdown|>
      {{#each @presets as |preset|}}
        <dropdown.item
          @label={{preset.label}}
          @icon={{faCheck}}
          @isIconHidden={{notEq preset.label this.activePreset.label}}
          data-test-preset
          {{on "click" (fn @onChange preset.values)}}
        />
      {{/each}}
      <dropdown.divider />
      {{#each @options as |attribute|}}
        <dropdown.item
          @label={{attribute.label}}
          @icon={{faCheck}}
          @isIconHidden={{not (includes attribute.value @selected)}}
          data-test-option
          {{on "click" (fn this.toggleAttribute attribute)}}
        />
      {{/each}}
    </Dropdown>
  </template>
}
