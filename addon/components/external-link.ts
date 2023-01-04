import Component from '@glimmer/component';

export interface ExternalLinkComponentSignature {
  Element: HTMLAnchorElement;
  Args: {
    url: string | File | null | undefined;
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
