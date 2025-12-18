import type { TOC } from '@ember/component/template-only';
import type { Color } from '@trusted-american/core';

export interface BannerSignature {
  Args: {
    color?: Color;
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
