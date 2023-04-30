import Component from '@glimmer/component';
import BsDropdown from 'ember-simple-bootstrap/components/bs/dropdown';

export interface DropdownSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [];
  };
}

export default class Dropdown extends Component<DropdownSignature> {
  <template>
    <BsDropdown @align='right' ...attributes>
      {{yield}}
    </BsDropdown>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Dropdown: typeof Dropdown;
  }
}
