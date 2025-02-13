import Component from '@glimmer/component';

export interface DropdownSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class Dropdown extends Component<DropdownSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Dropdown: typeof Dropdown;
  }
}
