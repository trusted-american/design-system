import type { TOC } from '@ember/component/template-only';

export interface MainBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const MainBody: TOC<MainBodySignature> = <template>
  <article
    class="container-fluid flex-grow-1 py-4"
    data-test-main-body
    ...attributes
  >
    {{yield}}
  </article>
</template>;

export default MainBody;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Body': typeof MainBody;
  }
}
