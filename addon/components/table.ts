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
    pagination?: 'local' | 'remote';
    nextText: string;
    previousText: string;
    canNext?: boolean;
    canPrevious?: boolean;
    onNext?: () => void;
    onPrevious?: () => void;
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
  Element: HTMLTableElement;
}

export default class Table<T> extends Component<TableSignature<T>> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Table: typeof Table;
  }
}
