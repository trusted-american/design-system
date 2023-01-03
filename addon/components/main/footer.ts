import Component from '@glimmer/component';

export interface MainFooterComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainFooterComponent extends Component<MainFooterComponentSignature> {}
