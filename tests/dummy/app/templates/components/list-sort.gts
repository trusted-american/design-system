import { array, hash } from '@ember/helper';
import { Heading, ListSort } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

const change = () => {
  //
};

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
      @onChange={{change}}
    />
    {{! END-SNIPPET }}
  </Snippet>
</template>
