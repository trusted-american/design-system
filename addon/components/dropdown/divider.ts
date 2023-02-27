import Component from '@glimmer/component';

export interface DropdownDividerComponentSignature {
  Element: HTMLHRElement;
}

export default class DropdownDividerComponent extends Component<DropdownDividerComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Divider': typeof DropdownDividerComponent;
  }
}
