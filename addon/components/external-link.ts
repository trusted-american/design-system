import Component from '@glimmer/component';

export interface ExternalLinkComponentSignature {
  Element: HTMLAnchorElement;
  Args: {
    url: string;
  };
  Blocks: {
    default: [];
  };
}

export default class ExternalLinkComponent extends Component<ExternalLinkComponentSignature> {}
