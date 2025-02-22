import type { TOC } from '@ember/component/template-only';

export interface MainFooterSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const MainFooter: TOC<MainFooterSignature> = <template>
  <footer
    class="container-fluid text-center text-secondary border-top p-4"
    data-test-main-footer
    ...attributes
  >
    {{yield}}
  </footer>
</template>;

export default MainFooter;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Footer': typeof MainFooter;
  }
}
