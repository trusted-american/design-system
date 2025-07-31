import type { TOC } from '@ember/component/template-only';
import { eq } from 'ember-truth-helpers';

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
    class="text-white text-center font-semibold p-2
      {{if
        (eq 'primary' @color)
        'bg-blue-500'
        (if
          (eq 'success' @color)
          'bg-success-500'
          (if
            (eq 'danger' @color)
            'bg-danger-500'
            (if
              (eq 'warning' @color)
              'bg-warning-500'
              (if (eq 'info' @color) 'bg-sky-500' 'bg-gray-500')
            )
          )
        )
      }}"
    data-test-banner
    ...attributes
  >
    {{yield}}
  </section>
</template>;

export default Banner;
