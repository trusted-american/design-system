import Component from '@glimmer/component';

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
    canNext?: unknown;
    canPrevious?: unknown;
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
      },
    ];
  };
  Element: HTMLDivElement;
}

export default class Table<T> extends Component<TableSignature<T>> {
  get offsetStart(): number | undefined {
    if (this.args.page === undefined || this.args.totalItems === undefined) {
      return undefined;
    }
    return 1 + this.args.page * 20;
  }

  get offsetEnd(): number | undefined {
    if (!this.offsetStart || this.args.totalItems === undefined) {
      return undefined;
    }
    return Math.min(this.offsetStart + 20 - 1, this.args.totalItems);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Table: typeof Table;
  }
}
