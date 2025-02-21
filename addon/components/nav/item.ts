import Component from '@glimmer/component';

import type { LinkToArgs } from '../button';

interface Args extends LinkToArgs {
  label?: string;
  icon?: string;
  count?: number;
  trailingIcon?: string;
  isDisabled?: boolean;
}

export interface NavItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

export default class NavItem extends Component<NavItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Nav::Item': typeof NavItem;
  }
}
