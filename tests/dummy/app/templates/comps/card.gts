import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Card, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Card"}}
    {{breadcrumb "Card" route="comps.card"}}

    <Heading @title="Card" />

    <Snippet @name="card.gts">
      {{! BEGIN-SNIPPET card }}
      <Card as |card|>
        <card.header>
          Header
        </card.header>
        <card.body>
          Body
        </card.body>
        <card.footer>
          Footer
        </card.footer>
      </Card>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
