import Component from '@glimmer/component';

import type { LinkToArgs } from '../button';
import type { IconName } from '@fortawesome/fontawesome-svg-core';

interface Args extends LinkToArgs {
  text?: string;
  subtitle?: string;
  icon?: IconName;
  shortcut?: string;
  color?: string;
  href?: string;
}

export interface DropdownItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class DropdownItem extends Component<DropdownItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Item': typeof DropdownItem;
  }
}
