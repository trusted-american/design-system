import Component from '@glimmer/component';

export interface MainBodyComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainBodyComponent extends Component<MainBodyComponentSignature> {}
