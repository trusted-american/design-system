import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import {
  faArrowDownWideShort,
  faArrowUpWideShort,
  faCheck,
} from '@fortawesome/free-solid-svg-icons';
import Component from '@glimmer/component';
import { not, notEq } from 'ember-truth-helpers';
import dropdown from '../modifiers/dropdown';
import Button from './button';
import Dropdown from './dropdown';
import type { Option } from './form/select';
import type { ListAttributesKey } from './list-attributes';

export interface ListSortSignature<T> {
  Args: {
    sortBy: ListAttributesKey<T>;
    sortAscending: boolean;
    options: Option<ListAttributesKey<T>>[];
    label: string;
    highToLowLabel: string;
    lowToHighLabel: string;
    onChange: (sortBy: ListAttributesKey<T>, sortAscending: boolean) => void;
  };
}

export default class ListSort<T> extends Component<ListSortSignature<T>> {
  <template>
    <Button
      @label={{@label}}
      @icon={{if @sortAscending faArrowUpWideShort faArrowDownWideShort}}
      data-test-list-sort
      {{dropdown autoClose="outside"}}
    />
    <Dropdown data-test-list-sort-dropdown as |dropdown|>
      {{#each @options as |opt|}}
        <dropdown.item
          @label={{opt.label}}
          @icon={{faCheck}}
          @isIconHidden={{notEq opt.value @sortBy}}
          data-test-sort-by
          {{on "click" (fn @onChange opt.value @sortAscending)}}
        />
      {{/each}}
      <dropdown.divider />
      <dropdown.item
        @label={{@highToLowLabel}}
        @icon={{faCheck}}
        @isIconHidden={{@sortAscending}}
        data-test-sort-ascending-false
        {{on "click" (fn @onChange @sortBy false)}}
      />
      <dropdown.item
        @label={{@lowToHighLabel}}
        @icon={{faCheck}}
        @isIconHidden={{not @sortAscending}}
        data-test-sort-ascending-true
        {{on "click" (fn @onChange @sortBy true)}}
      />
    </Dropdown>
  </template>
}
