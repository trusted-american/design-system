import Component from '@glimmer/component';

export interface DropdownItemComponentSignature {
  Element: HTMLButtonElement;
  Args: {
    text: string;
    icon?: string;
    color?: string;
  };
}

export default class DropdownItemComponent extends Component<DropdownItemComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Item': typeof DropdownItemComponent;
  }
}
