import Component from '@glimmer/component';

export interface MainHeaderComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainHeaderComponent extends Component<MainHeaderComponentSignature> {}
