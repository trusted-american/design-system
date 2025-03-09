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
    class="d-flex justify-content-between align-items-start gap-2 mb-4"
    data-test-subheading
    ...attributes
  >
    <h2 class="mb-0">
      {{@title}}
    </h2>
    {{yield}}
  </div>
</template>;

export default Subheading;
