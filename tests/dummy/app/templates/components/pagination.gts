import type { TOC } from '@ember/component/template-only';
import Snippet from '../../components/snippet';
import { fn } from '@ember/helper';
import {
  Heading,
  Pagination,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ComponentsPaginationController from '../../controllers/components/pagination';

interface ComponentsPaginationSignature {
  Args: {
    controller: ComponentsPaginationController;
  };
}

<template>
  {{pageTitle "Pagination"}}
  {{breadcrumb "Pagination" route="components.pagination"}}

  <Heading @title="Pagination" />

  <Subheading @title="Offset" />

  <p>Page: {{@controller.page}}</p>

  <Snippet @name="pagination.gts">
    {{! BEGIN-SNIPPET pagination }}
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

  <Subheading @title="Cursor" />

  <Snippet @name="pagination1.gts">
    {{! BEGIN-SNIPPET pagination1 }}
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
</template> satisfies TOC<ComponentsPaginationSignature>;
