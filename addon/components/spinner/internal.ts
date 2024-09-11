import Component from '@glimmer/component';

export interface SpinnerInternalSignature {
  Element: HTMLDivElement;
}

export default class SpinnerInternal extends Component<SpinnerInternalSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Spinner::Internal': typeof SpinnerInternal;
  }
}
