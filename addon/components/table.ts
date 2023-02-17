import Component from '@glimmer/component';

import type {
  YetiTableHeader,
  YetiTableBody,
  YetiTableFooter,
} from '@glint/environment-ember-loose/registry';

export interface TableComponentSignature<T> {
  Element: HTMLTableElement;
  Args: {
    data: T[];
    sortable?: boolean;
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
