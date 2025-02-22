import type { TOC } from '@ember/component/template-only';

export interface DropdownDividerSignature {
  Element: HTMLHRElement;
}

const DropdownDivider: TOC<DropdownDividerSignature> = <template>
  <hr class="dropdown-divider" ...attributes />
</template>;

export default DropdownDivider;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Divider': typeof DropdownDivider;
  }
}
