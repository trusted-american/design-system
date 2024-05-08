import Component from '@glimmer/component';

export interface ExternalLinkSignature {
  Args: {
    href: string;
    text?: string;
    icon?: string;
    iconPrefix?: string;
    iconTrailing?: boolean;
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
