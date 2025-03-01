import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Heading, Skeleton } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Skeleton"}}
    {{breadcrumb "Skeleton" route="components.skeleton"}}

    <Heading @title="Skeleton" />

    <Snippet @name="skeleton.gts">
      {{! BEGIN-SNIPPET skeleton }}
      <Skeleton class="col-6" />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
