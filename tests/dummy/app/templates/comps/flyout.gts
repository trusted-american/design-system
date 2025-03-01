import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { Button, Flyout, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFlyoutController from '../../controllers/comps/flyout';

export default RouteTemplate<{
  Args: {
    controller: CompsFlyoutController;
  };
}>(
  <template>
    {{pageTitle "Flyout"}}
    {{breadcrumb "Flyout" route="comps.flyout"}}

    <Heading @title="Flyout" />

    <Snippet @name="flyout.hbs">
      {{! BEGIN-SNIPPET flyout }}
      <Button
        @label="Open flyout"
        {{on "click" (fn (mut @controller.showFlyout) true)}}
      />

      {{#if @controller.showFlyout}}
        <Flyout
          @title="Title"
          @closeButtonLabel="Close"
          @onClose={{@controller.close}}
        >
          Body
        </Flyout>
      {{/if}}
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
