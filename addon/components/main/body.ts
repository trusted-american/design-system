import Component from '@glimmer/component';

export interface MainBodyComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainBodyComponent extends Component<MainBodyComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Body': typeof MainBodyComponent;
  }
}
