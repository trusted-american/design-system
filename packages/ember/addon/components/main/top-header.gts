import type { TOC } from '@ember/component/template-only';

export interface MainTopHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const MainTopHeader: TOC<MainTopHeaderSignature> = <template>
  <header
    class="container-fluid position-relative border-bottom py-3"
    data-test-main-top-header
    ...attributes
  >
    {{yield}}
  </header>
</template>;

export default MainTopHeader;
