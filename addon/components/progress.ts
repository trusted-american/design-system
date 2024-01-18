import Component from '@glimmer/component';

import type ProgressBar from './progress/bar';
import type { WithBoundArgs } from '@glint/template';

interface ProgressSignature {
  Blocks: {
    default: [
      {
        bar: WithBoundArgs<typeof ProgressBar, never>;
      },
    ];
  };
  Element: HTMLElement;
}

export default class Progress extends Component<ProgressSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Progress: typeof Progress;
  }
}
