import Component from '@glimmer/component';

import type { ComponentLike } from '@glint/template';

export interface ListGroupSignature {
  Element: HTMLUListElement;
  Args: {
    flush?: boolean;
    numbered?: boolean;
    horizontal?: boolean;
    color?: string;
  };
  Blocks: {
    default: [
      {
        item: ComponentLike<{
          Element: HTMLLIElement;
          Blocks: {
            default: [];
          };
        }>;
      }
    ];
  };
}

export default class ListGroup extends Component<ListGroupSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListGroup: typeof ListGroup;
  }
}
