import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Heading, Spinner } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "Spinner"}}
    {{breadcrumb "Spinner" route="components.spinner"}}

    <Heading @title="Spinner" />

    <Snippet @name="spinner.gts">
      {{! BEGIN-SNIPPET spinner }}
      <Spinner />
      <Spinner @color="secondary" />
      <Spinner @isLarge={{true}} />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
