import type { TOC } from '@ember/component/template-only';

export interface MainFooterSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const MainFooter: TOC<MainFooterSignature> = <template>
  <footer
    class="text-center text-gray-500 border-t border-gray-200 p-6"
    data-test-main-footer
    ...attributes
  >
    {{yield}}
  </footer>
</template>;

export default MainFooter;
