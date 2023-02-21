import Component from '@glimmer/component';

// import type {
//   YetiTableHeader,
//   YetiTableBody,
//   YetiTableFooter,
// } from '@glint/environment-ember-loose/registry';

export interface TdsTableComponentSignature<T> {
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

export default class TdsTableComponent<T> extends Component<
  TdsTableComponentSignature<T>
> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    TdsTable: typeof TdsTableComponent;
  }
}
