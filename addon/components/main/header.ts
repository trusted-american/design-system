import Component from '@glimmer/component';

export interface MainHeaderComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainHeaderComponent extends Component<MainHeaderComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Header': typeof MainHeaderComponent;
  }
}
