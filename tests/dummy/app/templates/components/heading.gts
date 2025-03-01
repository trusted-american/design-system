import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Heading"}}
    {{breadcrumb "Heading" route="components.heading"}}

    <Heading @title="Heading" />

    <Snippet @name="heading.gts">
      {{! BEGIN-SNIPPET heading }}
      <Heading @title="Title" @type="Type" @identifier="identifier">
        Actions
      </Heading>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
