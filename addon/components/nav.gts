import Component from '@glimmer/component';

import type { LinkToKeyword } from '@glint/environment-ember-loose/-private/intrinsics/link-to';

export interface NavSignature {
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

export default class Nav extends Component<NavSignature> {
  <template>
    <Bs::Nav @tabs={{not @pills}} @pills={{@pills}} ...attributes>
      {{! @glint-ignore }}
      {{yield (hash link-to=(component 'link-to' class='nav-link'))}}
    </Bs::Nav>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Nav: typeof Nav;
  }
}
