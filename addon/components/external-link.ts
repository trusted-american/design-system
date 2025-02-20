import Component from '@glimmer/component';

import type { IconPrefix } from '@fortawesome/fontawesome-svg-core';

export interface ExternalLinkSignature {
  Args: {
    href: string;
    label?: string;
    icon?: string;
    iconPrefix?: IconPrefix;
    isIconTrailing?: boolean;
    isIconOnly?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

export default class ExternalLink extends Component<ExternalLinkSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ExternalLink: typeof ExternalLink;
  }
}
