import Component from '@glimmer/component';

import type { Group } from 'ember-power-select/utils/group-utils';

export default class PowerSelectWithCreate<T> extends Component<{
  Args: {
    options?: (T | Group)[];
    selected: T | null | undefined;
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
    onChange: (selected: T) => void;
    onCreate?: (query: string) => void;
  };
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}> {}
