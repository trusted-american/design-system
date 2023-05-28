import Component from '@glimmer/component';

export interface PaginationSignature {
  Element: HTMLElement;
  Args: {
    curPage: number;
    perPage: number;
    totalItems: number;
    onChange: (curPage: number) => void;
  };
}

export default class Pagination extends Component<PaginationSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Pagination: typeof Pagination;
  }
}
