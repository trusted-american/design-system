import Component from '@glimmer/component';

import type EmberArray from '@ember/array';

export default class PowerSelect<T> extends Component<{
  Args: {
    options?: T[] | EmberArray<T>;
    selected: T;
    disabled?: unknown;
    placeholder?: string;
    renderInPlace?: boolean;
    searchEnabled?: boolean;
    searchField?: string;
    searchPlaceholder?: string;
    allowClear?: boolean;
    search?: (query: string) => unknown[];
    matcher?: unknown;
    onChange: (selected: never) => void;
  };
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}> {}
