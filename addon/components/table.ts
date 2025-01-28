import Component from '@glimmer/component';
import { action } from '@ember/object';

import type { ComponentLike } from '@glint/template';

export type YetiTableHeader = ComponentLike<{
  Blocks: {
    default: [
      {
        column: ComponentLike<{
          Args: {
            prop?: string;
            sortable?: boolean;
            sort?: 'asc' | 'desc' | null;
            visible?: unknown;
          };
          Blocks: {
            default: [];
          };
          Element: HTMLElement;
        }>;
      },
    ];
  };
  Element: HTMLElement;
}>;

export type YetiTableBody<T> = ComponentLike<{
  Blocks: {
    default: [
      {
        row: ComponentLike<{
          Args: {
            prop?: string;
          };
          Blocks: {
            default: [
              {
                cell: ComponentLike<{
                  Blocks: {
                    default: [];
                  };
                  Element: HTMLElement;
                }>;
              },
            ];
          };
          Element: HTMLElement;
        }>;
      },
      T,
    ];
  };
  Element: HTMLElement;
}>;

export type YetiTableFooter = ComponentLike<{
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}>;

export interface TableSignature<T> {
  Args: {
    data: T[];
    isSortable?: boolean;
    pagination?: 'local' | 'cursor' | 'offset';
    nextText: string;
    previousText: string;
    canNext?: boolean;
    canPrevious?: boolean;
    page?: number;
    totalItems?: number;
    onNext?: () => void;
    onPrevious?: () => void;
    onChangePage?: (page: number) => void;
  };
  Blocks: {
    default: [
      {
        header: YetiTableHeader;
        body: YetiTableBody<T>;
        footer: YetiTableFooter;
        paginationData: {
          isFirstPage: boolean;
          isLastPage: boolean;
          pageEnd: number;
          pageNumber: number;
          pageSize: number;
          pageStart: number;
          totalPages: undefined;
          totalRows: number;
        };
        actions: {
          changePageSize: () => void;
          goToPage: () => void;
          nextPage: () => void;
          previousPage: () => void;
          reloadData: () => void;
        };
      },
    ];
  };
  Element: HTMLDivElement;
}

export default class Table<T> extends Component<TableSignature<T>> {
  @action
  next(event: Event) {
    event.preventDefault();
    if (this.args.onNext) {
      this.args.onNext();
    }
  }

  @action
  previous(event: Event) {
    event.preventDefault();
    if (this.args.onPrevious) {
      this.args.onPrevious();
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Table: typeof Table;
  }
}
