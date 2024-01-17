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

export default class Pagination extends Component<PaginationSignature> {
  get pages(): number[] {
    const num = Math.ceil(this.args.totalItems / this.args.perPage);
    return new Array(num);
  }

  get canPrev(): boolean {
    return this.args.curPage > 0;
  }

  get canNext(): boolean {
    return this.args.curPage < this.pages.length - 1;
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Pagination: typeof Pagination;
  }
}
