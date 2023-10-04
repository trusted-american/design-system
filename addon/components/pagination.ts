import Component from '@glimmer/component';

export interface PaginationSignature {
  Args: {
    curPage: number;
    perPage: number;
    totalItems: number;
    onChange: (curPage: number) => void;
  };
  Element: HTMLElement;
}

export default class Pagination extends Component<PaginationSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Pagination: typeof Pagination;
  }
}
