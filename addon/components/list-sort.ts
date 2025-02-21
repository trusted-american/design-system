import Component from '@glimmer/component';

import type { Option } from '@trusted-american/design-system/components/form/select';

export interface ListSortSignature<T> {
  Args: {
    sortBy: keyof T;
    sortAscending: boolean;
    options: Option<keyof T>[];
    label: string;
    highToLowLabel: string;
    lowToHighLabel: string;
    onChange: (sortBy: keyof T, sortAscending: boolean) => void;
  };
}

export default class ListSort<T> extends Component<ListSortSignature<T>> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ListSort: typeof ListSort;
  }
}
