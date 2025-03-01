import RouteTemplate from 'ember-route-template';
import { on } from '@ember/modifier';
import { LinkTo } from '@ember/routing';
import {
  Button,
  Dropdown,
  DropdownItem,
  Heading,
  MainBody,
  Subheading,
  dropdown,
  tooltip,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../components/snippet';

import type { TemplateFactory } from 'global';
import type ModifiersController from '../controllers/modifiers';

export default RouteTemplate<{
  Args: {
    controller: ModifiersController;
  };
}>(
  <template>
    {{pageTitle "Modifiers"}}
    {{breadcrumb "Modifiers" route="modifiers"}}

    <MainBody>
      <Heading @title="Modifiers" />

      <Subheading @title="Collapse" />

      <p><LinkTo @route="components.collapse">See collapse component</LinkTo></p>

      <Subheading @title="Dropdown" />

      <Snippet @name="dropdown.gts">
        {{! BEGIN-SNIPPET dropdown }}
        <Button @label="Open dropdown" {{dropdown}} />
        <Dropdown>
          <DropdownItem @label="Item" />
        </Dropdown>
        {{! END-SNIPPET }}
      </Snippet>

      <Subheading @title="Tooltip" />

      <Snippet @name="tooltip.gts">
        {{! BEGIN-SNIPPET tooltip }}
        <Button
          @label="Tooltip on top"
          {{tooltip
            (if @controller.isClicked "Copied!" "Tooltip on top")
            placement="top"
          }}
          {{on "click" @controller.click}}
        />
        <Button
          @label="Tooltip on right"
          {{tooltip "Tooltip on right" placement="right"}}
        />
        <Button
          @label="Tooltip on bottom"
          {{tooltip "Tooltip on bottom" placement="bottom"}}
        />
        <Button
          @label="Tooltip on left"
          {{tooltip "Tooltip on left" placement="left"}}
        />
        <Button
          @label="Tooltip with HTML"
          {{tooltip "<em>Tooltip</em> <u>with</u> <b>HTML</b>" html=true}}
        />
        <Button
          @label="Hover me"
          {{tooltip "This is a tooltip." trigger="hover"}}
        />
        {{! END-SNIPPET }}
      </Snippet>

      {{#if @controller.isClicked}}
        <p>Copied!</p>
      {{/if}}
    </MainBody>
  </template>,
) as TemplateFactory;
