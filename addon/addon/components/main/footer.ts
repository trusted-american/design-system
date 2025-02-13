import Component from '@glimmer/component';

export interface MainFooterSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class MainFooter extends Component<MainFooterSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Footer': typeof MainFooter;
  }
}
