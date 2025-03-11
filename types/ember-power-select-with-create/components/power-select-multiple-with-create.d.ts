import Component from '@glimmer/component';

export default class PowerSelectMultipleWithCreate<T> extends Component<{
  Args: {
    options: T[];
    selected: T[];
    disabled?: boolean;
    placeholder?: string;
    renderInPlace?: boolean;
    searchEnabled?: boolean;
    searchField?: string;
    onChange: (selected: never) => void;
    onCreate: (query: string) => void;
  };
  Blocks: {
    default: [T];
  };
  Element: HTMLElement;
}> {}
