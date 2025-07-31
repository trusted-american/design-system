import type { TOC } from '@ember/component/template-only';

export interface MainBodySignature {
  Args: {
    isCentered?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const MainBody: TOC<MainBodySignature> = <template>
  <article
    class="px-6 flex-grow py-6{{if
        @isCentered
        ' flex justify-center items-center'
      }}"
    data-test-main-body
    ...attributes
  >
    {{yield}}
  </article>
</template>;

export default MainBody;
