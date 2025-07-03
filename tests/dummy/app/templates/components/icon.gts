import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Heading, Icon } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import { faFlag } from '@fortawesome/free-solid-svg-icons';

export default RouteTemplate(
  <template>
    {{pageTitle "Icon"}}
    {{breadcrumb "Icon" route="components.icon"}}

    <Heading @title="Icon" />

    <Snippet @name="icon.gts">
      {{! BEGIN-SNIPPET icon }}
      <Icon @icon={{faFlag}} />
      <Icon @icon={{faFlag}} @color="danger" />
      <Icon @icon={{faFlag}} @size="sm" />
      <Icon @icon={{faFlag}} />
      <Icon @icon={{faFlag}} @size="lg" />
      <Icon @icon={{faFlag}} @size="xl" />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
