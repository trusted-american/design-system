import RouteTemplate from 'ember-route-template';
import { MainBody } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "Components"}}
    {{breadcrumb "Components" route="components"}}

    <MainBody>
      {{outlet}}
    </MainBody>
  </template>,
);
