import Component from '@glimmer/component';

export interface CardBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class CardBody extends Component<CardBodySignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Card::Body': typeof CardBody;
    'card/body': typeof CardBody;
  }
}
