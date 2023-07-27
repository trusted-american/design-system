import Component from '@glimmer/component';

export interface MainBodySignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainBody extends Component<MainBodySignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Body': typeof MainBody;
  }
}
