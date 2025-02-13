import Component from '@glimmer/component';

export interface MainBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class MainBody extends Component<MainBodySignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Body': typeof MainBody;
  }
}
