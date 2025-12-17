import { Heading, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Subheading"}}
  {{breadcrumb "Subheading" route="components.subheading"}}

  <Heading @title="Subheading" />

  <Snippet @name="subheading.gts">
    {{! BEGIN-SNIPPET subheading }}
    <Subheading @title="Subheading">
      Actions
    </Subheading>
    {{! END-SNIPPET }}
  </Snippet>
</template>
