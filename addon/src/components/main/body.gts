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
    class="container-fluid flex-grow-1 py-4{{if
        @isCentered
        ' d-flex justify-content-center align-items-center'
      }}"
    data-test-main-body
    ...attributes
  >
    {{yield}}
  </article>
</template>;

export default MainBody;
