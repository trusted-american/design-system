import RouteTemplate from 'ember-route-template';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>{{outlet}}</template>,
) as TemplateFactory;
