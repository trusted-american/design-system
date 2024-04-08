import Component from '@glimmer/component';

import type {
  YetiTableHeader,
  YetiTableBody,
  YetiTableFooter,
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
        tfoot: ComponentLike<{
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
        pagination: ComponentLike<{
          Element: HTMLElement;
        }>;
      },
    ];
  };
  Element: HTMLTableElement;
}> {}
