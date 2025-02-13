import Component from '@glimmer/component';

export interface PaginationItemSignature {
  Args: {
    page?: number;
    index: number;
    onClick: (event: Event) => void;
  };
}

export default class PaginationItem extends Component<PaginationItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Pagination::Item': typeof PaginationItem;
  }
}
