import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Banner, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Banner"}}
    {{breadcrumb "Banner" route="comps.banner"}}

    <Heading @title="Banner" />

    <Snippet @name="banner.gts">
      {{! BEGIN-SNIPPET banner }}
      <Banner @color="primary">
        This is a banner.
      </Banner>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
