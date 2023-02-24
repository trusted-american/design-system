import Component from '@glimmer/component';

export interface ButtonSetComponentSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [];
  };
}

export default class ButtonSetComponent extends Component<ButtonSetComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ButtonSet: typeof ButtonSetComponent;
  }
}
