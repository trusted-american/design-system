import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Badge, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Badge"}}
    {{breadcrumb "Badge" route="comps.badge"}}

    <Heading @title="Badge" />

    <Snippet @name="badge.gts">
      {{! BEGIN-SNIPPET badge }}
      <Badge @label="Default badge" />
      <Badge @label="Success badge" @color="success" />
      <Badge @label="Success badge with icon" @color="success" @icon="check" />
      <Badge @label="Loading badge" @isLoading={{true}} />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
