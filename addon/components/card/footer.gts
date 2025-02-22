import Component from '@glimmer/component';

export interface CardFooterSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class CardFooter extends Component<CardFooterSignature> {
  <template>
    <div class="card-footer" ...attributes>
      {{yield}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Card::Footer': typeof CardFooter;
    'card/footer': typeof CardFooter;
  }
}
