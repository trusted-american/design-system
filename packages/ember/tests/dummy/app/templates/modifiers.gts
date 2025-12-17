import { on } from '@ember/modifier';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { faArrowRight } from '@fortawesome/free-solid-svg-icons';
import {
  Button,
  Dropdown,
  Heading,
  Link,
  MainBody,
  Subheading,
  dropdown,
  tooltip,
} from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../components/snippet';
import type ModifiersRoute from '../routes/modifiers';

interface ModifiersSignature {
  Args: {
    model: ModelFrom<ModifiersRoute>;
  };
}

export default class Modifiers extends Component<ModifiersSignature> {
  timeout?: number;

  @tracked isClicked = false;

  click = () => {
    this.isClicked = true;

    clearTimeout(this.timeout);

    this.timeout = setTimeout(() => {
      this.isClicked = false;
    }, 5000);
  };

  <template>
    {{pageTitle "Modifiers"}}
    {{breadcrumb "Modifiers" route="modifiers"}}

    <MainBody>
      <Heading @title="Modifiers" />

      <Subheading @title="Collapse" />

      <p><Link
          @route="components.collapse"
          @icon={{faArrowRight}}
          @isIconTrailing={{true}}
        >See collapse component</Link></p>

      <Subheading @title="Dropdown" />

      <Snippet @name="dropdown.gts">
        {{! BEGIN-SNIPPET dropdown }}
        <Button @label="Open dropdown" {{dropdown}} />
        <Dropdown as |dropdown|>
          <dropdown.item @label="Item" />
        </Dropdown>
        {{! END-SNIPPET }}
      </Snippet>

      <Subheading @title="Tooltip" />

      <Snippet @name="tooltip.gts">
        {{! BEGIN-SNIPPET tooltip }}
        <Button
          @label="Tooltip on top"
          {{tooltip
            (if this.isClicked "Copied!" "Tooltip on top")
            placement="top"
          }}
          {{on "click" this.click}}
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

      {{#if this.isClicked}}
        <p>Copied!</p>
      {{/if}}
    </MainBody>
  </template>
}
