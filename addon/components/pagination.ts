import { action } from '@ember/object';
import Component from '@glimmer/component';

interface Args {
  nextText: string;
  previousText: string;
  viewingText: string;
  ofText: string;
  resultsText: string;
}

interface Args1 extends Args {
  page: number;
  pageSize: number;
  totalItems: number;
  onChange: (page: number) => void;
}

interface Args2 extends Args {
  page?: never;
  canNext: boolean;
  canPrevious: boolean;
  onNext: () => void;
  onPrevious: () => void;
  onChange?: never;
}

export interface PaginationSignature {
  Args: Args1 | Args2;
  Element: HTMLDivElement;
}

export default class Pagination extends Component<PaginationSignature> {
  get twoAway(): number {
    return this.pages.length - 2; // used For the trailing ... logic
  }
  get length(): number {
    return this.pages.length - 1;
  }

  get beforeCurrentIndex(): number {
    if (!this.args.page) {
      return -1;
    }
    return this.args.page - 1;
  }

  get afterCurrentIndex(): number {
    if (!this.args.page) {
      return -1;
    }
    return this.args.page + 1;
  }

  get pages(): number[] {
    if (!('pageSize' in this.args)) {
      return [];
    }
    const num = Math.ceil(this.args.totalItems / this.args.pageSize);
    return new Array(num) as number[];
  }

  get canNext(): boolean {
    if ('canNext' in this.args) {
      return this.args.canNext;
    }
    return this.args.page < this.pages.length - 1;
  }

  get canPrevious(): boolean {
    if ('canPrevious' in this.args) {
      return this.args.canPrevious;
    }
    return this.args.page > 0;
  }

  get pageStart(): number {
    if (!('pageSize' in this.args)) {
      return 0;
    }
    return 1 + this.args.page * this.args.pageSize;
  }

  get pageEnd(): number {
    if (!('pageSize' in this.args)) {
      return 0;
    }
    return Math.min(
      this.pageStart + this.args.pageSize - 1,
      this.args.totalItems,
    );
  }

  @action
  next(event: Event) {
    event.preventDefault();

    if ('pageSize' in this.args) {
      this.args.onChange(this.args.page + 1);
    } else {
      this.args.onNext();
    }
  }

  @action
  previous(event: Event) {
    event.preventDefault();

    if ('pageSize' in this.args) {
      this.args.onChange(this.args.page - 1);
    } else {
      this.args.onPrevious();
    }
  }

  @action
  change(index: number, event: Event) {
    event.preventDefault();

    if ('onChange' in this.args) {
      this.args.onChange?.(index);
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Pagination: typeof Pagination;
  }
}
