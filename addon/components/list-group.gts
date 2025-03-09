import { concat } from '@ember/helper';

import type { TOC } from '@ember/component/template-only';

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
    {{yield}}
  </ul>
</template>;

export default ListGroup;
