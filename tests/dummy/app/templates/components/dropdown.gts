import type { TOC } from '@ember/component/template-only';
import Snippet from '../../components/snippet';
import { on } from '@ember/modifier';
import {
  Button,
  Dropdown,
  DropdownHeader,
  Heading,
  dropdown,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ComponentsDropdownController from '../../controllers/components/dropdown';
import {
  faCopy,
  faPen,
  faPlus,
  faQuoteLeft,
  faTrash,
} from '@fortawesome/free-solid-svg-icons';

interface ComponentsDropdownSignature {
  Args: {
    controller: ComponentsDropdownController;
  };
}

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
          {{on "click" @controller.click}}
        />
        <dropdown.item
          @label="Quote reply"
          @icon={{faQuoteLeft}}
          @shortcut="⌘Q"
          {{on "click" @controller.click}}
        />
        <dropdown.item
          @label="Edit comment"
          @icon={{faPen}}
          @shortcut="⌘E"
          {{on "click" @controller.click}}
        />
        <dropdown.divider />
        <dropdown.item
          @label="Delete file"
          @icon={{faTrash}}
          @shortcut="⌘D"
          @color="danger"
          {{on "click" @controller.click}}
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
  </template> satisfies TOC<ComponentsDropdownSignature>;
