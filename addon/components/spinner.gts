import SpinnerInternal from './spinner/internal';

import type { TOC } from '@ember/component/template-only';

export interface SpinnerSignature {
  Element: HTMLDivElement;
}

const Spinner: TOC<SpinnerSignature> = <template>
  <div
    class="d-flex align-items-center justify-content-center"
    data-test-spinner
    ...attributes
  >
    <SpinnerInternal class="text-primary" />
  </div>
</template>;

export default Spinner;
