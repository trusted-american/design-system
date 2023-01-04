import Component from '@glimmer/component';

export interface MainTopHeaderComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainTopHeaderComponent extends Component<MainTopHeaderComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::TopHeader': typeof MainTopHeaderComponent;
  }
}
