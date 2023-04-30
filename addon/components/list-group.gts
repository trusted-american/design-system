import Component from '@glimmer/component';
import { hash, concat } from '@ember/helper';
import BsListGroupItem from 'ember-simple-bootstrap/components/bs/list-group/item';

export interface ListGroupSignature {
  Element: HTMLUListElement;
  Args: {
    flush?: boolean;
    numbered?: boolean;
    horizontal?: boolean;
    color?: string;
  };
  Blocks: {
    default: [
      {
        item: typeof BsListGroupItem;
      }
    ];
  };
}

export default class ListGroup extends Component<ListGroupSignature> {
  <template>
    <ul
      class='list-group
        {{if @flush "list-group-flush"}}
        {{if @numbered "list-group-numbered"}}
        {{if @horizontal "list-group-horizontal"}}
        {{if @color (concat "list-group-item-" @color)}}'
      ...attributes
    >
      {{yield (hash item=BsListGroupItem)}}
    </ul>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListGroup: typeof ListGroup;
  }
}
