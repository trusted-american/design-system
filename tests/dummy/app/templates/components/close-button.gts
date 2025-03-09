import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { CloseButton, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "Close button"}}
    {{breadcrumb "Close button" route="components.close-button"}}

    <Heading @title="Close button" />

    <Snippet @name="close-button.gts">
      {{! BEGIN-SNIPPET close-button }}
      <CloseButton @label="Close" />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
