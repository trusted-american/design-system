import { BreadcrumbTrail, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Breadcrumb trail"}}
  {{breadcrumb "Breadcrumb trail" route="components.breadcrumb-trail"}}

  <Heading @title="Breadcrumb trail" />

  <Snippet @name="breadcrumb-trail.gts">
    {{! BEGIN-SNIPPET breadcrumb-trail }}
    <BreadcrumbTrail />
    {{! END-SNIPPET }}
  </Snippet>
</template>
