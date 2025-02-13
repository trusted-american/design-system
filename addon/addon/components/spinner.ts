import Component from '@glimmer/component';

export interface SpinnerSignature {
  Element: HTMLDivElement;
}

export default class Spinner extends Component<SpinnerSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Spinner: typeof Spinner;
  }
}
