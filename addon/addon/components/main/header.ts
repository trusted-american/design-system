import Component from '@glimmer/component';

export interface MainHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class MainHeader extends Component<MainHeaderSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Header': typeof MainHeader;
  }
}
