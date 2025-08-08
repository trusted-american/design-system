import type { TOC } from '@ember/component/template-only';

export interface MainHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const MainHeader: TOC<MainHeaderSignature> = <template>
  <header class="px-6 bg-gray-100 pt-4" data-test-main-header ...attributes>
    {{yield}}
  </header>
</template>;

export default MainHeader;
