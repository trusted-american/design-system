import Component from '@glimmer/component';

interface TitleCardSignature {
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

export default class TitleCard extends Component<TitleCardSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    TitleCard: typeof TitleCard;
  }
}
