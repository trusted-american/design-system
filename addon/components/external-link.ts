import Component from '@glimmer/component';

export interface ExternalLinkComponentSignature {
  Element: HTMLAnchorElement;
  Args: {
    text?: string;
    url: string | File | null | undefined;
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
