import Component from '@glimmer/component';

export interface DropdownComponentSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [];
  };
}

export default class DropdownComponent extends Component<DropdownComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Dropdown: typeof DropdownComponent;
  }
}
