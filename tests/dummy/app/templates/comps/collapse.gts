import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import {
  Button,
  collapse,
  Collapse,
  Heading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Collapse"}}
    {{breadcrumb "Collapse" route="comps.collapse"}}

    <Heading @title="Collapse" />

    <Snippet @name="collapse.gts">
      {{! BEGIN-SNIPPET collapse }}
      <Button @label="Click me" {{collapse "identifier"}} />
      <Collapse id="identifier">
        Collapsed content
      </Collapse>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
