import Component from '@glimmer/component';

import type { LinkToKeyword } from '@glint/environment-ember-loose/-private/intrinsics/link-to';

export interface NavComponentSignature {
  Element: HTMLElement;
  Args: {
    pills?: boolean;
  };
  Blocks: {
    default: [
      {
        'link-to': LinkToKeyword;
      }
    ];
    footer: [];
  };
}

export default class NavComponent extends Component<NavComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Nav: typeof NavComponent;
  }
}
