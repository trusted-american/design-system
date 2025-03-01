import ProgressBar from './progress/bar';
import { hash } from '@ember/helper';

import type { TOC } from '@ember/component/template-only';

export interface ProgressSignature {
  Blocks: {
    default: [
      {
        bar: typeof ProgressBar;
      },
    ];
  };
  Element: HTMLElement;
}

const Progress: TOC<ProgressSignature> = <template>
  <div class="progress" data-test-progress ...attributes>
    {{yield (hash bar=ProgressBar)}}
  </div>
</template>;

export default Progress;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Progress: typeof Progress;
  }
}
