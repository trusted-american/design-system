import Component from '@glimmer/component';

import type { IconName, IconPrefix } from '@fortawesome/fontawesome-svg-core';

export interface LinkToArgs {
  route?: string;
  model?: unknown;
  query?: Record<string, unknown>;
}

interface Args extends LinkToArgs {
  isSubmit?: true;
  text: string;
  icon?: IconName;
  iconPrefix?: IconPrefix;
  isIconTrailing?: boolean;
  isIconOnly?: boolean;
  size?: 'sm' | 'lg';
  isOutline?: boolean;
  isFullWidth?: boolean;
  color?: string;
  isLoading?: boolean;
  href?: string;
  count?: number;
  isLabel?: boolean;
  isLocalHref?: boolean;
  shortcut?: string;
}

export interface ButtonSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLButtonElement | HTMLAnchorElement | HTMLLabelElement;
}

export default class Button extends Component<ButtonSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof Button;
  }
}
