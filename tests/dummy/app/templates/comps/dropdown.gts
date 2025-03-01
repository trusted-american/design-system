import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { on } from '@ember/modifier';
import {
  Button,
  Dropdown,
  dropdown,
  DropdownDivider,
  DropdownHeader,
  DropdownItem,
  Heading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsDropdownController from '../../controllers/comps/dropdown';

export default RouteTemplate<{
  Args: {
    controller: CompsDropdownController;
  };
}>(
  <template>
    {{pageTitle "Dropdown"}}
    {{breadcrumb "Dropdown" route="comps.dropdown"}}

    <Heading @title="Dropdown" />

    <Snippet @name="dropdown.gts">
      {{! BEGIN-SNIPPET dropdown }}
      <Button @label="Open dropdown" {{dropdown}} />
      <Dropdown>
        <DropdownItem
          @label="Copy link"
          @subtitle="Due by December 31, 2021"
          @icon="copy"
          @shortcut="⌘C"
          {{on "click" @controller.click}}
        />
        <DropdownItem
          @label="Quote reply"
          @icon="quote-left"
          @shortcut="⌘Q"
          {{on "click" @controller.click}}
        />
        <DropdownItem
          @label="Edit comment"
          @icon="pen"
          @shortcut="⌘E"
          {{on "click" @controller.click}}
        />
        <DropdownDivider />
        <DropdownItem
          @label="Delete file"
          @icon="trash"
          @shortcut="⌘D"
          @color="danger"
          {{on "click" @controller.click}}
        />
        <DropdownDivider />
        <DropdownItem @label="Route" @icon="plus" @route="index" />
        <DropdownHeader @label="Header" />
        <DropdownItem
          @label="Href"
          @icon="plus"
          @href="https://www.google.com/"
        />
      </Dropdown>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
