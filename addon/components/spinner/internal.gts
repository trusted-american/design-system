import type { TOC } from '@ember/component/template-only';

export interface SpinnerInternalSignature {
  Element: HTMLDivElement;
}

const SpinnerInternal: TOC<SpinnerInternalSignature> = <template>
  <div
    class="spinner-border spinner-border-sm"
    role="status"
    ...attributes
  ></div>
</template>;

export default SpinnerInternal;
