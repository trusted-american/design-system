import RouteTemplate from 'ember-route-template';
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

export default RouteTemplate<{
  Args: {
    controller: ComponentsDropdownController;
  };
}>(
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
          @icon="copy"
          @shortcut="⌘C"
          {{on "click" @controller.click}}
        />
        <dropdown.item
          @label="Quote reply"
          @icon="quote-left"
          @shortcut="⌘Q"
          {{on "click" @controller.click}}
        />
        <dropdown.item
          @label="Edit comment"
          @icon="pen"
          @shortcut="⌘E"
          {{on "click" @controller.click}}
        />
        <dropdown.divider />
        <dropdown.item
          @label="Delete file"
          @icon="trash"
          @shortcut="⌘D"
          @color="danger"
          {{on "click" @controller.click}}
        />
        <dropdown.divider />
        <dropdown.item @label="Route" @icon="plus" @route="index" />
        <DropdownHeader @label="Header" />
        <dropdown.item
          @label="Href"
          @icon="plus"
          @href="https://www.google.com/"
        />
      </Dropdown>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
