import type { TOC } from '@ember/component/template-only';

export interface MainTopHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const MainTopHeader: TOC<MainTopHeaderSignature> = <template>
  <header
    class="px-6 position-relative border-b border-gray-200 py-4"
    data-test-main-top-header
    ...attributes
  >
    {{yield}}
  </header>
</template>;

export default MainTopHeader;
