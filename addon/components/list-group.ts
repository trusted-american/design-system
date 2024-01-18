import Component from '@glimmer/component';

export interface ListGroupSignature {
  Args: {
    flush?: boolean;
    numbered?: boolean;
    horizontal?: boolean;
    color?: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLUListElement;
}

export default class ListGroup extends Component<ListGroupSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListGroup: typeof ListGroup;
  }
}
