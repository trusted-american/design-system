import type { TOC } from '@ember/component/template-only';

export interface BannerSignature {
  Args: {
    color: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const Banner: TOC<BannerSignature> = <template>
  <section
    class="text-bg-{{@color}} text-center fw-semibold p-2"
    data-test-banner
    ...attributes
  >
    {{yield}}
  </section>
</template>;

export default Banner;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Banner: typeof Banner;
  }
}
