import Component from '@glimmer/component';

export interface ExternalLinkComponentSignature {
  Element: HTMLAnchorElement;
  Args: {
    url: string;
  };
}

export default class ExternalLinkComponent extends Component<ExternalLinkComponentSignature> {}
