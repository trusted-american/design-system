import Component from '@glimmer/component';

import type { IconName } from '@fortawesome/fontawesome-svg-core';

export interface NavItemInternalSignature {
  Args: {
    text?: string;
    icon?: IconName;
    count?: number;
    trailingIcon?: IconName;
  };
  Blocks: {
    default: [];
  };
}

export default class NavItemInternal extends Component<NavItemInternalSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Nav::Item::Internal': typeof NavItemInternal;
  }
}
