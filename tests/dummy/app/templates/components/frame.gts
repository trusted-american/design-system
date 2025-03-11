import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Frame, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "Frame"}}
    {{breadcrumb "Frame" route="components.frame"}}

    <Heading @title="Frame" />

    <Snippet @name="frame.gts">
      {{! BEGIN-SNIPPET frame }}
      <Frame>
        Content
      </Frame>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
