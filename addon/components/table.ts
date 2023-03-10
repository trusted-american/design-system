import Component from '@glimmer/component';
import { ComponentLike } from '@glint/template';

export type YetiTableHeader = ComponentLike<{
  Element: HTMLElement;
  Blocks: {
    default: [
      {
        column: ComponentLike<{
          Element: HTMLElement;
          Args: {
            prop?: string;
            sortable?: boolean;
            sort?: 'asc' | 'desc' | null;
            visible?: unknown;
          };
          Blocks: {
            default: [];
          };
        }>;
      }
    ];
  };
}>;

export type YetiTableBody<T> = ComponentLike<{
  Element: HTMLElement;
  Blocks: {
    default: [
      {
        row: ComponentLike<{
          Element: HTMLElement;
          Args: {
            prop?: string;
          };
          Blocks: {
            default: [
              {
                cell: ComponentLike<{
                  Element: HTMLElement;
                  Blocks: {
                    default: [];
                  };
                }>;
              }
            ];
          };
        }>;
      },
      T
    ];
  };
}>;

export type YetiTableFooter = ComponentLike<{
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}>;

export interface TableComponentSignature<T> {
  Element: HTMLTableElement;
  Args: {
    data: T[];
    sortable?: boolean;
    pagination?: 'local' | 'remote';
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
      }
    ];
  };
}

export default class TableComponent<T> extends Component<
  TableComponentSignature<T>
> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Table: typeof TableComponent;
  }
}
