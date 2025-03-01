import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Icon, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Icon"}}
    {{breadcrumb "Icon" route="comps.icon"}}

    <Heading @title="Icon" />

    <Snippet @name="icon.hbs">
      {{! BEGIN-SNIPPET icon }}
      <Icon @icon="flag" />
      <Icon @icon="flag" @color="danger" />
      <Icon @icon="flag" @size="sm" />
      <Icon @icon="flag" />
      <Icon @icon="flag" @size="lg" />
      <Icon @icon="flag" @size="xl" />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
