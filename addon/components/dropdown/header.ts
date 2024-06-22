import Component from '@glimmer/component';

export interface DropdownHeaderSignature {
  Args: {
    text: string;
  };
  Element: HTMLHeadingElement;
}

export default class DropdownHeader extends Component<DropdownHeaderSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Header': typeof DropdownHeader;
  }
}
