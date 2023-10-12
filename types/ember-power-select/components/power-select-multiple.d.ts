import Component from '@glimmer/component';

import type EmberArray from '@ember/array';

export default class PowerSelectMultiple<T> extends Component<{
  Args: {
    options?: T[] | EmberArray<T>;
    selected: T[] | EmberArray<T>;
    disabled?: unknown;
    placeholder?: string;
    renderInPlace?: boolean;
    searchEnabled?: boolean;
    searchField?: string;
    onChange: (selected: never[]) => void;
  };
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}> {}
