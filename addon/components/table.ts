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

export type YetiTableTfoot = ComponentLike<{
  Blocks: {
    default: [
      {
        row: ComponentLike<{
          Blocks: {
            default: [
              {
                cell: ComponentLike<{
                  Args: {
                    visible?: boolean;
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
      },
    ];
  };
  Element: HTMLElement;
}>;

export interface PaginationData {
  isFirstPage: boolean;
  isLastPage: boolean;
  pageEnd: number;
  pageNumber: number;
  pageSize: number;
  pageStart: number;
  totalPages: undefined;
  totalRows: number;
}

export interface Actions {
  changePageSize: () => void;
  goToPage: (page: number) => void;
  nextPage: () => void;
  previousPage: () => void;
  reloadData: () => void;
}

export interface TableSignature<T> {
  Args: {
    data: T[];
    isSortable?: boolean;
    pagination?: 'local' | 'cursor' | 'offset';
    nextButtonLabel: string;
    previousButtonLabel: string;
    viewingText: string;
    ofText: string;
    resultsText: string;
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
        tfoot: YetiTableTfoot;
        paginationData: PaginationData;
        actions: Actions;
      },
    ];
  };
  Element: HTMLDivElement;
}

export default class Table<T> extends Component<TableSignature<T>> {
  @action
  goToPage(actions: Actions, page: number): void {
    actions.goToPage(page + 1);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Table: typeof Table;
  }
}
