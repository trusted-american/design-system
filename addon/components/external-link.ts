import Component from '@glimmer/component';

export interface ExternalLinkSignature {
  Element: HTMLAnchorElement;
  Args: {
    href: string;
    text?: string;
    icon?: string;
  };
  Blocks: {
    default: [];
  };
}

export default class ExternalLink extends Component<ExternalLinkSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ExternalLink: typeof ExternalLink;
  }
}
