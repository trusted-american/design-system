import Component from '@glimmer/component';

export interface ButtonSetSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class ButtonSet extends Component<ButtonSetSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ButtonSet: typeof ButtonSet;
  }
}
