import Component from '@glimmer/component';

export interface MainSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class Main extends Component<MainSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Main: typeof Main;
  }
}
