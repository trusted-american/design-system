import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { BreadcrumbTrail, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Breadcrumb trail"}}
    {{breadcrumb "Breadcrumb trail" route="comps.breadcrumb-trail"}}

    <Heading @title="Breadcrumb trail" />

    <Snippet @name="breadcrumb-trail.gts">
      {{! BEGIN-SNIPPET breadcrumb-trail }}
      <BreadcrumbTrail />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
