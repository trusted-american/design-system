import Component from '@glimmer/component';

import type { LinkToArgs } from '../button';
import type { IconName } from '@fortawesome/fontawesome-svg-core';

interface Args extends LinkToArgs {
  text: string;
  icon?: IconName;
  count?: number;
  trailingIcon?: IconName;
  isDisabled?: boolean;
}

export interface AsideItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

export default class AsideItem extends Component<AsideItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Item': typeof AsideItem;
  }
}
