import RouteTemplate from 'ember-route-template';
import { Heading, MainBody } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "Not Found"}}
    {{breadcrumb "Not Found" route="not-found"}}

    <MainBody>
      <Heading @title="Not Found" />
    </MainBody>
  </template>,
);
