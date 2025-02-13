import Component from '@glimmer/component';

export interface DropdownDividerSignature {
  Element: HTMLHRElement;
}

export default class DropdownDivider extends Component<DropdownDividerSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Divider': typeof DropdownDivider;
  }
}
