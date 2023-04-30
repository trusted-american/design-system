declare module 'ember-yeti-table/components/yeti-table/component' {
  import Component from '@glimmer/component';
  import YetiTableHeader from 'ember-yeti-table/components/yeti-table/header';
  import YetiTableBody from 'ember-yeti-table/components/yeti-table/body';
  import YetiTableTFoot from 'ember-yeti-table/components/yeti-table/tfoot';
  import YetiTablePagination from 'ember-yeti-table/components/yeti-table/pagination';

  export default class YetiTable<T> extends Component<{
    Element: HTMLTableElement;
    Args: {
      data: T[];
      pagination?: boolean;
      sortable?: boolean;
    };
    Blocks: {
      default: [
        {
          columns: [];
          header: typeof YetiTableHeader;
          body: typeof YetiTableBody<T>;
          tfoot: typeof YetiTableTFoot;
          pagination: typeof YetiTablePagination;
        }
      ];
    };
  }> {}
}

declare module 'ember-yeti-table/components/yeti-table/header' {
  import Component from '@glimmer/component';
  import { ComponentLike } from '@glint/template';

  export default class YetiTableHeader extends Component<{
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
  }> {}
}

declare module 'ember-yeti-table/components/yeti-table/body' {
  import Component from '@glimmer/component';
  import { ComponentLike } from '@glint/template';
  import YetiTableTBodyCell from 'ember-yeti-table/components/yeti-table/tbody/row/cell';

  export default class YetiTableBody<T> extends Component<{
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
                  cell: typeof YetiTableTBodyCell;
                }
              ];
            };
          }>;
        },
        T
      ];
    };
  }> {}
}

declare module 'ember-yeti-table/components/yeti-table/tfoot' {
  import Component from '@glimmer/component';
  import { ComponentLike } from '@glint/template';
  import YetiTableTBodyCell from 'ember-yeti-table/components/yeti-table/tbody/row/cell';

  export default class YetiTableTFoot extends Component<{
    Element: HTMLElement;
    Blocks: {
      default: [
        {
          row: ComponentLike<{
            Element: HTMLElement;
            Blocks: {
              default: [
                {
                  cell: typeof YetiTableTBodyCell;
                }
              ];
            };
          }>;
        }
      ];
    };
  }> {}
}

declare module 'ember-yeti-table/components/yeti-table/pagination' {
  import Component from '@glimmer/component';

  export default class YetiTablePagination extends Component<{
    Element: HTMLElement;
  }> {}
}

declare module 'ember-yeti-table/components/yeti-table/tbody/row/cell' {
  import Component from '@glimmer/component';

  export default class YetiTableTBodyCell extends Component<{
    Element: HTMLElement;
    Args: {
      visible?: boolean;
    };
    Blocks: {
      default: [];
    };
  }> {}
}
