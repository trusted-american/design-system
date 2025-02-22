import { on } from '@ember/modifier';
import { inc } from '@nullvoxpopuli/ember-composable-helpers';
import { eq } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';

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
      {{inc @index}}
    </a>
  </li>
</template>;

export default PaginationItem;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Pagination::Item': typeof PaginationItem;
  }
}
