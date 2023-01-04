import Component from '@glimmer/component';

export interface MainComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainComponent extends Component<MainComponentSignature> {}
