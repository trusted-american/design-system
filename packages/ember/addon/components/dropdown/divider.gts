import type { TOC } from '@ember/component/template-only';

export interface DropdownDividerSignature {
  Element: HTMLHRElement;
}

const DropdownDivider: TOC<DropdownDividerSignature> = <template>
  <hr class="dropdown-divider" data-test-dropdown-divider ...attributes />
</template>;

export default DropdownDivider;
