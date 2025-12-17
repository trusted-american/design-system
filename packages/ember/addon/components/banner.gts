import type { TOC } from '@ember/component/template-only';

export interface BannerSignature {
  Args: {
    color?: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const Banner: TOC<BannerSignature> = <template>
  <section
    class="text-bg-{{if @color @color 'primary'}} text-center fw-semibold p-2"
    data-test-banner
    ...attributes
  >
    {{yield}}
  </section>
</template>;

export default Banner;
