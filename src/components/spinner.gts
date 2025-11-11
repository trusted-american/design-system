import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';

export interface SpinnerSignature {
  Args: {
    color?: string;
    isLarge?: boolean;
  };
  Element: HTMLDivElement;
}

const Spinner: TOC<SpinnerSignature> = <template>
  <div
    class="spinner-border
      {{unless @isLarge 'spinner-border-sm'}}
      {{if @color (concat 'text-' @color) 'text-primary'}}"
    role="status"
    data-test-spinner
    ...attributes
  >
    {{! TODO: string }}
    <span class="visually-hidden">Loading…</span>
  </div>
</template>;

export default Spinner;
