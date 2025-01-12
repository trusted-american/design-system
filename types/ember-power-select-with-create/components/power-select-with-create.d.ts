import Component from '@glimmer/component';

import type EmberArray from '@ember/array';

export default class PowerSelectWithCreate<T> extends Component<{
  Args: {
    options?: T[] | EmberArray<T>;
    selected: T;
    disabled?: unknown;
    placeholder?: string;
    renderInPlace?: boolean;
    searchEnabled?: boolean;
    searchField?: string;
    searchPlaceholder?: string;
    search?: (query: string) => unknown[];
    allowClear?: boolean;
    verticalPosition?: 'auto' | 'above' | 'below';
    showCreatePosition?: string;
    matcher?: unknown;
    onChange: (selected: never) => void;
    onCreate?: (query: string) => void;
  };
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}> {}
