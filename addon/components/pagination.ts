import { action } from '@ember/object';
import Component from '@glimmer/component';

export interface PaginationSignature {
  Args: {
    curPage: number;
    pageSize: number;
    totalItems: number;
    onChange: (curPage: number) => void;
  };
  Element: HTMLElement;
}

export default class Pagination extends Component<PaginationSignature> {
  get pages(): number[] {
    const num = Math.ceil(this.args.totalItems / this.args.pageSize);
    return new Array(num) as number[];
  }

  get canPrev(): boolean {
    return this.args.curPage > 0;
  }

  get canNext(): boolean {
    return this.args.curPage < this.pages.length - 1;
  }

  @action
  previous(event: Event) {
    event.preventDefault();
    this.args.onChange(this.args.curPage - 1);
  }

  @action
  next(event: Event) {
    event.preventDefault();
    this.args.onChange(this.args.curPage + 1);
  }

  @action
  change(index: number, event: Event) {
    event.preventDefault();
    this.args.onChange(index);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Pagination: typeof Pagination;
  }
}
