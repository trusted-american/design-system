import Component from '@glimmer/component';
import Button from './button';
import Dropdown from './dropdown';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import dropdown from '../modifiers/dropdown';
import { notEq } from 'ember-truth-helpers';
import type { Option } from './form/select';
import { faCheck } from '@fortawesome/free-solid-svg-icons';

export interface ListSortSignature<T> {
  Args: {
    sortBy: keyof T & string;
    sortAscending: boolean;
    options: Option<keyof T & string>[];
    label: string;
    highToLowLabel: string;
    lowToHighLabel: string;
    onChange: (sortBy: keyof T & string, sortAscending: boolean) => void;
  };
}

export default class ListSort<T> extends Component<ListSortSignature<T>> {
  <template>
    <Button
      @label={{@label}}
      @icon={{if @sortAscending "arrow-up-wide-short" "arrow-down-wide-short"}}
      data-test-list-sort
      {{dropdown autoClose="outside"}}
    />
    <Dropdown data-test-list-sort-dropdown as |dropdown|>
      {{#each @options as |opt|}}
        <dropdown.item
          @label={{opt.label}}
          @icon={{faCheck}}
          class={{if (notEq opt.value @sortBy) "invisible-icon"}}
          data-test-sort-by
          {{on "click" (fn @onChange opt.value @sortAscending)}}
        />
      {{/each}}
      <dropdown.divider />
      <dropdown.item
        @label={{@highToLowLabel}}
        @icon={{faCheck}}
        class={{if (notEq false @sortAscending) "invisible-icon"}}
        data-test-sort-ascending-false
        {{on "click" (fn @onChange @sortBy false)}}
      />
      <dropdown.item
        @label={{@lowToHighLabel}}
        @icon={{faCheck}}
        class={{if (notEq true @sortAscending) "invisible-icon"}}
        data-test-sort-ascending-true
        {{on "click" (fn @onChange @sortBy true)}}
      />
    </Dropdown>
  </template>
}
