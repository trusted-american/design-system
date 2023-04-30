import Component from '@glimmer/component';
import BsNav from 'ember-simple-bootstrap/components/bs/nav';
import not from 'ember-truth-helpers/helpers/not';
import { hash } from '@ember/helper';
import { LinkTo } from '@ember/routing';

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
    <BsNav @tabs={{not @pills}} @pills={{@pills}} ...attributes>
      {{! @glint-ignore }}
      {{yield (hash link-to=(component LinkTo class='nav-link'))}}
    </BsNav>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Nav: typeof Nav;
  }
}
