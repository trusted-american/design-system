import Component from '@glimmer/component';

export interface DropdownHeaderSignature {
  Args: {
    label: string;
  };
  Element: HTMLHeadingElement;
}

export default class DropdownHeader extends Component<DropdownHeaderSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Header': typeof DropdownHeader;
  }
}
