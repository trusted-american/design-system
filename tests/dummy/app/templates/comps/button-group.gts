import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Button, ButtonGroup, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Button group"}}
    {{breadcrumb "Button group" route="comps.button-group"}}

    <Heading @title="Button group" />

    <Snippet @name="button-group.gts">
      {{! BEGIN-SNIPPET button-group }}
      <ButtonGroup>
        <Button @label="First" />
        <Button @label="Second" />
      </ButtonGroup>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
