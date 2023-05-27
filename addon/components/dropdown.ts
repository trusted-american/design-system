import Component from '@glimmer/component';

export interface DropdownSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [];
  };
}

export default class Dropdown extends Component<DropdownSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Dropdown: typeof Dropdown;
  }
}
