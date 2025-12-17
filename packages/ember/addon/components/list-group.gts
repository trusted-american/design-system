import type { TOC } from '@ember/component/template-only';
import { concat, hash } from '@ember/helper';
import ListGroupItem from './list-group/item';

export interface ListGroupSignature {
  Args: {
    isFlush?: boolean;
    isNumbered?: boolean;
    isHorizontal?: boolean;
    color?: string;
  };
  Blocks: {
    default: [{ item: typeof ListGroupItem }];
  };
  Element: HTMLUListElement;
}

const ListGroup: TOC<ListGroupSignature> = <template>
  <ul
    class="list-group
      {{if @isFlush 'list-group-flush'}}
      {{if @isNumbered 'list-group-numbered'}}
      {{if @isHorizontal 'list-group-horizontal'}}
      {{if @color (concat 'list-group-item-' @color)}}"
    data-test-list-group
    ...attributes
  >
    {{yield (hash item=ListGroupItem)}}
  </ul>
</template>;

export default ListGroup;
