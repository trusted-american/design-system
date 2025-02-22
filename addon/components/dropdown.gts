import Component from '@glimmer/component';

export interface DropdownSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class Dropdown extends Component<DropdownSignature> {
  <template>
    <div
      class="dropdown-menu dropdown-menu-end"
      data-test-dropdown
      ...attributes
    >
      {{yield}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Dropdown: typeof Dropdown;
  }
}
