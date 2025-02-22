import Component from '@glimmer/component';

export interface CardHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class CardHeader extends Component<CardHeaderSignature> {
  <template>
    <div class="card-header" ...attributes>
      {{yield}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Card::Header': typeof CardHeader;
  }
}
