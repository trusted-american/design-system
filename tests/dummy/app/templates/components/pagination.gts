import Component from '@glimmer/component';
import { fn } from '@ember/helper';
import {
  Heading,
  Pagination,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface ComponentsPaginationSignature {
  Args: {};
}

export default class ComponentsPagination extends Component<ComponentsPaginationSignature> {
  page = 5;

  next = () => {
    alert('Action');
  };

  previous = () => {
    alert('Action');
  };
}

<template>
  {{pageTitle "Pagination"}}
  {{breadcrumb "Pagination" route="components.pagination"}}

  <Heading @title="Pagination" />

  <Subheading @title="Offset" />

  <p>Page: {{this.page}}</p>

  <Snippet @name="pagination.gts">
    {{! BEGIN-SNIPPET pagination }}
    <Pagination
      @page={{this.page}}
      @pageSize={{1}}
      @totalItems={{10}}
      @nextButtonLabel="Next"
      @previousButtonLabel="Previous"
      @viewingLabel="Viewing"
      @ofLabel="of"
      @resultsLabel="results"
      @onChange={{fn (mut this.page)}}
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
      @onNext={{this.next}}
      @onPrevious={{this.previous}}
    />
    {{! END-SNIPPET }}
  </Snippet>
  </template>
}
