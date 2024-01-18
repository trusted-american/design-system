import Component from '@glimmer/component';

import type { LinkToKeyword } from '@glint/environment-ember-loose/-private/intrinsics/link-to';

export interface NavSignature {
  Args: {
    pills?: boolean;
  };
  Blocks: {
    default: [
      {
        'link-to': LinkToKeyword;
      },
    ];
    footer: [];
  };
  Element: HTMLElement;
}

export default class Nav extends Component<NavSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Nav: typeof Nav;
  }
}
