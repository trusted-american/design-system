import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import MainBody from './main/body';
import MainFooter from './main/footer';
import MainTopHeader from './main/top-header';

export interface MainSignature {
  Blocks: {
    default: [
      {
        topHeader: typeof MainTopHeader;
        body: typeof MainBody;
        footer: typeof MainFooter;
      },
    ];
  };
  Element: HTMLElement;
}

const Main: TOC<MainSignature> = <template>
  <main
    class="d-flex flex-column flex-grow-1 bg-body overflow-y-auto"
    data-test-main
    ...attributes
  >
    {{yield (hash topHeader=MainTopHeader body=MainBody footer=MainFooter)}}
  </main>
</template>;

export default Main;
