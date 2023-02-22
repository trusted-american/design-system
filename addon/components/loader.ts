import Component from '@glimmer/component';

export interface LoaderComponentSignature {
  Element: HTMLDivElement;
}

export default class LoaderComponent extends Component<LoaderComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Loader: typeof LoaderComponent;
  }
}
