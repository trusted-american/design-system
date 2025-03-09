import type { TOC } from '@ember/component/template-only';

export interface MainSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const Main: TOC<MainSignature> = <template>
  <main
    class="d-flex flex-column flex-grow-1 bg-body overflow-y-auto"
    data-test-main
    ...attributes
  >
    {{yield}}
  </main>
</template>;

export default Main;
