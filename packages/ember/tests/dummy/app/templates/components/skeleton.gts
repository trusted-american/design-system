import { Heading, Skeleton } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Skeleton"}}
  {{breadcrumb "Skeleton" route="components.skeleton"}}

  <Heading @title="Skeleton" />

  <Snippet @name="skeleton.gts">
    {{! BEGIN-SNIPPET skeleton }}
    <Skeleton class="col-6" />
    {{! END-SNIPPET }}
  </Snippet>
</template>
