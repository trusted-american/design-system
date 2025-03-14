import RouteTemplate from 'ember-route-template';
import { MainBody } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "Guides"}}
    {{breadcrumb "Guides" route="guides"}}

    <MainBody>
      {{outlet}}
    </MainBody>
  </template>,
);
