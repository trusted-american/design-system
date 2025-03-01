import Component from '@glimmer/component';

import type {
  Actions,
  PaginationData,
  YetiTableBody,
  YetiTableFooter,
  YetiTableHeader,
  YetiTableTfoot,
} from '@trusted-american/design-system/components/table';
import type { ComponentLike } from '@glint/template';

export default class YetiTable<T> extends Component<{
  Args: {
    data: T[];
    pagination?: boolean;
    sortable?: boolean;
    pageSize?: number;
  };
  Blocks: {
    default: [
      {
        columns: [];
        header: YetiTableHeader;
        body: YetiTableBody<T>;
        footer: YetiTableFooter;
        tfoot: YetiTableTfoot;
        pagination: ComponentLike<{
          Element: HTMLElement;
        }>;
        paginationData: PaginationData;
        actions: Actions;
      },
    ];
  };
  Element: HTMLTableElement;
}> {}
