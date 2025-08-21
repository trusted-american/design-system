import type { TOC } from '@ember/component/template-only';
import { on } from '@ember/modifier';
import { eq } from 'ember-truth-helpers';

const increment = (value: number) => value + 1;

export interface PaginationItemSignature {
  Args: {
    page?: number;
    index: number;
    onClick: (event: Event) => void;
  };
}

const PaginationItem: TOC<PaginationItemSignature> = <template>
  <li>
    <a
      href="#"
      class={{if
        (eq @page @index)
        "flex items-center justify-center px-3 h-8 text-blue-600 border border-gray-300 bg-blue-50 hover:bg-blue-100 hover:text-blue-700"
        "flex items-center justify-center px-3 h-8 ms-0 leading-tight text-gray-500 bg-white border border-e-0 border-gray-300 rounded-s-lg hover:bg-gray-100 hover:text-gray-700"
      }}
      aria-current={{if (eq @page @index) "page"}}
      {{on "click" @onClick}}
    >
      {{increment @index}}
    </a>
  </li>
</template>;

export default PaginationItem;
