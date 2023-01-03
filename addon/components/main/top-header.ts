import Component from '@glimmer/component';

export interface MainTopHeaderComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainTopHeaderComponent extends Component<MainTopHeaderComponentSignature> {}
