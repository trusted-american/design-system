import { on } from '@ember/modifier';
import { eq } from 'ember-truth-helpers';
import type { TOC } from '@ember/component/template-only';

const increment = (value: number) => value + 1;

export interface PaginationItemSignature {
  Args: {
    page?: number;
    index: number;
    onClick: (event: Event) => void;
  };
}

const PaginationItem: TOC<PaginationItemSignature> = <template>
  <li class="page-item {{if (eq @page @index) 'active'}}">
    <a class="page-link" href="#" {{on "click" @onClick}}>
      {{increment @index}}
    </a>
  </li>
</template>;

export default PaginationItem;
