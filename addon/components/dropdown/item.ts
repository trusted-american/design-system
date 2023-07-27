import Component from '@glimmer/component';

export interface DropdownItemSignature {
  Element: HTMLElement;
  Args: {
    text: string;
    icon?: string;
    color?: string;
    route?: string;
    href?: string;
  };
}

export default class DropdownItem extends Component<DropdownItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Item': typeof DropdownItem;
  }
}
