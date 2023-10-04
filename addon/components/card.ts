import Component from '@glimmer/component';

export interface CardSignature {
  Args: {
    title?: string;
  };
  Blocks: {
    default: [];
    header: [];
    padded: [];
  };
  Element: HTMLDivElement;
}

export default class Card extends Component<CardSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Card: typeof Card;
  }
}
