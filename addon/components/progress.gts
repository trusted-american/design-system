import Component from '@glimmer/component';
import ProgressBar from './progress/bar';
import { hash } from '@ember/helper';

import type { WithBoundArgs } from '@glint/template';

export interface ProgressSignature {
  Blocks: {
    default: [
      {
        bar: WithBoundArgs<typeof ProgressBar, never>;
      },
    ];
  };
  Element: HTMLElement;
}

export default class Progress extends Component<ProgressSignature> {
  <template>
    <div class="progress" data-test-progress ...attributes>
      {{yield (hash bar=ProgressBar)}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Progress: typeof Progress;
  }
}
