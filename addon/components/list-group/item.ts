import Component from '@glimmer/component';

interface ListGroupItemSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLLIElement;
}

export default class ListGroupItem extends Component<ListGroupItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'ListGroup::Item': typeof ListGroupItem;
  }
}
