import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import {
  faCopy,
  faPen,
  faPlus,
  faQuoteLeft,
  faTrash,
} from '@fortawesome/free-solid-svg-icons';
import {
  Button,
  Dropdown,
  DropdownHeader,
  Heading,
  dropdown,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface ComponentsDropdownSignature {
  Args: {};
}

export default class ComponentsDropdown extends Component<ComponentsDropdownSignature> {
  click = () => {
    alert('Action');
  };

  <template>
    {{pageTitle "Dropdown"}}
    {{breadcrumb "Dropdown" route="components.dropdown"}}

    <Heading @title="Dropdown" />

    <Snippet @name="dropdown.gts">
      {{! BEGIN-SNIPPET dropdown }}
      <Button @label="Open dropdown" {{dropdown}} />
      <Dropdown as |dropdown|>
        <dropdown.item
          @label="Copy link"
          @subtitle="Due by December 31, 2021"
          @icon={{faCopy}}
          @shortcut="⌘C"
          {{on "click" this.click}}
        />
        <dropdown.item
          @label="Quote reply"
          @icon={{faQuoteLeft}}
          @shortcut="⌘Q"
          {{on "click" this.click}}
        />
        <dropdown.item
          @label="Edit comment"
          @icon={{faPen}}
          @shortcut="⌘E"
          {{on "click" this.click}}
        />
        <dropdown.divider />
        <dropdown.item
          @label="Delete file"
          @icon={{faTrash}}
          @shortcut="⌘D"
          @color="danger"
          {{on "click" this.click}}
        />
        <dropdown.divider />
        <dropdown.item @label="Route" @icon={{faPlus}} @route="index" />
        <DropdownHeader @label="Header" />
        <dropdown.item
          @label="Href"
          @icon={{faPlus}}
          @href="https://www.google.com/"
        />
      </Dropdown>
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
