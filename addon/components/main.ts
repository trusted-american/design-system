import Component from '@glimmer/component';

export interface MainComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainComponent extends Component<MainComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Main: typeof MainComponent;
  }
}
