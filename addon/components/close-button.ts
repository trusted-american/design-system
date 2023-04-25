import Component from '@glimmer/component';

export interface CloseButtonComponentSignature {
  Element: HTMLButtonElement;
}

export default class CloseButtonComponent extends Component<CloseButtonComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    CloseButton: typeof CloseButtonComponent;
  }
}
