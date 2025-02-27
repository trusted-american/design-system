import RouteTemplate from 'ember-route-template';
import { MainBody } from '@trusted-american/design-system';
import { pageTitle } from 'ember-page-title';
import { breadcrumb } from 'ember-breadcrumb-trail';

export default RouteTemplate(
  <template>
    {{pageTitle "Components"}}
    {{breadcrumb "Components" route="comps"}}

    <MainBody>
      {{outlet}}
    </MainBody>
  </template>,
);
