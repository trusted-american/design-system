import Component from '@glimmer/component';

export interface CloseButtonSignature {
  Element: HTMLButtonElement;
}

export default class CloseButton extends Component<CloseButtonSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    CloseButton: typeof CloseButton;
  }
}
