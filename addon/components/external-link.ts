import Component from '@glimmer/component';

export interface ExternalLinkComponentSignature {
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

export default class ExternalLinkComponent extends Component<ExternalLinkComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ExternalLink: typeof ExternalLinkComponent;
  }
}
