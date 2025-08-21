import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import ProgressBar from './progress/bar';

export interface ProgressSignature {
  Blocks: {
    default: [{ bar: typeof ProgressBar }];
  };
  Element: HTMLElement;
}

const Progress: TOC<ProgressSignature> = <template>
  <div
    class="flex overflow-hidden bg-gray-200 rounded-lg h-4"
    data-test-progress
    ...attributes
  >
    {{yield (hash bar=ProgressBar)}}
  </div>
</template>;

export default Progress;
