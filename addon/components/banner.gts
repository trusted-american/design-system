import type { TOC } from '@ember/component/template-only';
import { get } from '@ember/helper';
import { or } from 'ember-truth-helpers';

const colorVariants = {
  primary: 'bg-blue-500',
  secondary: 'bg-gray-500',
  success: 'bg-success-500',
  danger: 'bg-danger-500',
  warning: 'bg-warning-500',
  info: 'bg-sky-500',
  light: '',
  dark: '',
};

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
      {{get colorVariants (or @color 'secondary')}}"
    data-test-banner
    ...attributes
  >
    {{yield}}
  </section>
</template>;

export default Banner;
