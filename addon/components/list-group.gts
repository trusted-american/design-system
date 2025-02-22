import Component from '@glimmer/component';
import { concat } from '@ember/helper';

export interface ListGroupSignature {
  Args: {
    isFlush?: boolean;
    isNumbered?: boolean;
    isHorizontal?: boolean;
    color?: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLUListElement;
}

export default class ListGroup extends Component<ListGroupSignature> {
  <template>
    <ul
      class="list-group
        {{if @isFlush 'list-group-flush'}}
        {{if @isNumbered 'list-group-numbered'}}
        {{if @isHorizontal 'list-group-horizontal'}}
        {{if @color (concat 'list-group-item-' @color)}}"
      data-test-list-group
      ...attributes
    >
      {{yield}}
    </ul>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListGroup: typeof ListGroup;
  }
}
