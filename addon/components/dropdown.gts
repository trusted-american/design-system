import type { TOC } from '@ember/component/template-only';

export interface DropdownSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const Dropdown: TOC<DropdownSignature> = <template>
  <div class="dropdown-menu dropdown-menu-end" data-test-dropdown ...attributes>
    {{yield}}
  </div>
</template>;

export default Dropdown;
