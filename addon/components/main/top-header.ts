import Component from '@glimmer/component';

export interface MainTopHeaderSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainTopHeader extends Component<MainTopHeaderSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::TopHeader': typeof MainTopHeader;
  }
}
