import type { TOC } from '@ember/component/template-only';

export interface SubheadingSignature {
  Args: {
    title: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const Subheading: TOC<SubheadingSignature> = <template>
  <div
    class="flex justify-between items-start gap-2 mb-6"
    data-test-subheading
    ...attributes
  >
    <h2 class="text-3xl font-bold">
      {{@title}}
    </h2>
    {{yield}}
  </div>
</template>;

export default Subheading;
