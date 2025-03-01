import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { fn } from '@ember/helper';
import {
  Heading,
  Pagination,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsPaginationController from '../../controllers/comps/pagination';

export default RouteTemplate<{
  Args: {
    controller: CompsPaginationController;
  };
}>(
  <template>
    {{pageTitle "Pagination"}}
    {{breadcrumb "Pagination" route="comps.pagination"}}

    <Heading @title="Pagination" />

    <Subheading @title="Pagination 1" />

    <p>Page: {{@controller.page}}</p>

    <Snippet @name="pagination1.gts">
      {{! BEGIN-SNIPPET pagination1 }}
      <Pagination
        @page={{@controller.page}}
        @pageSize={{1}}
        @totalItems={{10}}
        @nextButtonLabel="Next"
        @previousButtonLabel="Previous"
        @viewingLabel="Viewing"
        @ofLabel="of"
        @resultsLabel="results"
        @onChange={{fn (mut @controller.page)}}
      />
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Pagination 2" />

    <Snippet @name="pagination2.gts">
      {{! BEGIN-SNIPPET pagination2 }}
      <Pagination
        @canNext={{false}}
        @canPrevious={{false}}
        @nextButtonLabel="Next"
        @previousButtonLabel="Previous"
        @viewingLabel="Viewing"
        @ofLabel="of"
        @resultsLabel="results"
        @onNext={{@controller.next}}
        @onPrevious={{@controller.previous}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
