import Component from '@glimmer/component';

export interface DropdownItemSignature {
  Args: {
    text: string;
    subtitle?: string;
    icon?: string;
    shortcut?: string;
    color?: string;
    route?: string;
    model?: unknown;
    href?: string;
  };
  Element: HTMLElement;
}

export default class DropdownItem extends Component<DropdownItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Item': typeof DropdownItem;
  }
}
