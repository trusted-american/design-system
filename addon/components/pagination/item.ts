import Component from '@glimmer/component';

export interface PaginationItemSignature {
  // The arguments accepted by the component
  Args: {
    page: number;
    index: number;
    onClick: (event: Event) => void;
  };
  // Any blocks yielded by the component
  Blocks: {
    default: [];
  };
  // The element to which `...attributes` is applied in the component template
  Element: null;
}

export default class PaginationItemComponent extends Component<PaginationItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Pagination::Item': typeof PaginationItemComponent;
  }
}
