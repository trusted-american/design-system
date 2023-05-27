import Component from '@glimmer/component';

export interface LoaderSignature {
  Element: HTMLDivElement;
}

export default class Loader extends Component<LoaderSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Loader: typeof Loader;
  }
}
