import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { on } from '@ember/modifier';
import { Button, Flyout, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';
import type ComponentsFlyoutRoute from '../../routes/components/flyout';

interface ComponentsFlyoutSignature {
  Args: {
    model: ModelFrom<ComponentsFlyoutRoute>;
  };
}

export default class ComponentsFlyout extends Component<ComponentsFlyoutSignature> {
  @tracked showFlyout = false;

  close = () => {
    this.showFlyout = false;
  };

  <template>
    {{pageTitle "Flyout"}}
    {{breadcrumb "Flyout" route="components.flyout"}}

    <Heading @title="Flyout" />

    <Snippet @name="flyout.gts">
      {{! BEGIN-SNIPPET flyout }}
      <Button
        @label="Open flyout"
        {{on "click" (fn (mut this.showFlyout) true)}}
      />

      {{#if this.showFlyout}}
        <Flyout
          @title="Title"
          @closeButtonLabel="Close"
          @onClose={{this.close}}
        >
          Body
        </Flyout>
      {{/if}}
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
