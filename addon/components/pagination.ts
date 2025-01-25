import { action } from '@ember/object';
import Component from '@glimmer/component';

export interface PaginationSignature {
  Args: {
    page: number;
    pageSize: number;
    totalItems: number;
    nextText: string;
    previousText: string;
    onChange: (page: number) => void;
  };
  Element: HTMLDivElement;
}

export default class Pagination extends Component<PaginationSignature> {
  get pages(): number[] {
    const num = Math.ceil(this.args.totalItems / this.args.pageSize);
    return new Array(num) as number[];
  }

  get canNext(): boolean {
    return this.args.page < this.pages.length - 1;
  }

  get canPrevious(): boolean {
    return this.args.page > 0;
  }

  get pageStart(): number {
    return 1 + this.args.page * this.args.pageSize;
  }

  get pageEnd(): number {
    return Math.min(
      this.pageStart + this.args.pageSize - 1,
      this.args.totalItems,
    );
  }

  @action
  next(event: Event) {
    event.preventDefault();
    this.args.onChange(this.args.page + 1);
  }

  @action
  previous(event: Event) {
    event.preventDefault();
    this.args.onChange(this.args.page - 1);
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
