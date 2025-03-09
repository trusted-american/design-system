import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { array } from '@ember/helper';
import { hash } from '@ember/helper';
import { noop } from '@nullvoxpopuli/ember-composable-helpers';
import { Heading, ListSort } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "List sort"}}
    {{breadcrumb "List sort" route="components.list-sort"}}

    <Heading @title="List sort" />

    <Snippet @name="list-sort.gts">
      {{! BEGIN-SNIPPET list-sort }}
      <ListSort
        @sortBy="createdAt"
        @sortAscending={{false}}
        @options={{array (hash value="createdAt" label="Created date")}}
        @label="Sort"
        @highToLowLabel="High to low"
        @lowToHighLabel="Low to high"
        @onChange={{(noop)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
