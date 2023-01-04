import Component from '@glimmer/component';

export interface MainFooterComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainFooterComponent extends Component<MainFooterComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Footer': typeof MainFooterComponent;
  }
}
