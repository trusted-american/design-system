import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Heading, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Subheading"}}
    {{breadcrumb "Subheading" route="comps.subheading"}}

    <Heading @title="Subheading" />

    <Snippet @name="subheading.gts">
      {{! BEGIN-SNIPPET subheading }}
      <Subheading @title="Subheading">
        Actions
      </Subheading>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
