import Component from '@glimmer/component';

export interface CardComponentSignature {
  Element: HTMLDivElement;
  Args: {
    title: string;
  };
  Blocks: {
    default: [];
  };
}

export default class CardComponent extends Component<CardComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Card: typeof CardComponent;
  }
}
