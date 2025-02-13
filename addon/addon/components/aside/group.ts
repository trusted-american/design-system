import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';

import type { IconName } from '@fortawesome/fontawesome-svg-core';

export interface AsideGroupSignature {
  Args: {
    text: string;
    icon?: IconName;
    route: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

export default class AsideGroup extends Component<AsideGroupSignature> {
  id = guidFor(this);
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Group': typeof AsideGroup;
  }
}
