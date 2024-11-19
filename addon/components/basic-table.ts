import Component from '@glimmer/component';

export interface BasicTableSignature {
  Args: {
    isSmall?: boolean;
    isBordered?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLTableElement;
}

export default class BasicTable extends Component<BasicTableSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    BasicTable: typeof BasicTable;
  }
}
