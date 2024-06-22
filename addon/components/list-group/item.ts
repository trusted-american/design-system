import Component from '@glimmer/component';

import type { LinkToArgs } from '../button';

interface Args extends LinkToArgs {
  href?: string;
  isAction?: boolean;
}

export interface ListGroupItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement | HTMLLIElement;
}

export default class ListGroupItem extends Component<ListGroupItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'ListGroup::Item': typeof ListGroupItem;
  }
}
