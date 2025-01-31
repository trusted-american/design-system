import Component from '@glimmer/component';

export interface PaginationEllipsisSignature {
  // The arguments accepted by the component
  Args: unknown;
  // Any blocks yielded by the component
  Blocks: {
    default: [];
  };
  // The element to which `...attributes` is applied in the component template
  Element: null;
}

export default class PaginationEllipsisComponent extends Component<PaginationEllipsisSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Pagination::Ellipsis': typeof PaginationEllipsisComponent;
  }
}
