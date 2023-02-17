import Component from '@glimmer/component';

// import type {
//   YetiTableHeader,
//   YetiTableBody,
//   YetiTableFooter,
// } from '@glint/environment-ember-loose/registry';

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
        header: any;
        body: any;
        footer: any;
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
