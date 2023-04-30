import Component from '@glimmer/component';
import BsDropdown from 'ember-simple-bootstrap/components/bs/dropdown';

export interface DropdownComponentSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [];
  };
}

export default class DropdownComponent extends Component<DropdownComponentSignature> {
  <template>
    <BsDropdown @align='right' ...attributes>
      {{yield}}
    </BsDropdown>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Dropdown: typeof DropdownComponent;
  }
}
