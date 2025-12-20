import { Heading, Spinner, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Spinner"}}
  {{breadcrumb "Spinner" route="components.spinner"}}

  <Heading @title="Spinner" />

  <Subheading @title="Examples" />

  <Snippet @name="spinner.gts">
    {{! BEGIN-SNIPPET spinner }}
    <Spinner />
    <Spinner @color="secondary" />
    <Spinner @color="success" />
    <Spinner @color="danger" />
    <Spinner @color="warning" />
    <Spinner @color="info" />
    <Spinner @color="upsell" />
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="spinner1.gts">
    {{! BEGIN-SNIPPET spinner1 }}
    <Spinner />
    <Spinner @color="secondary" />
    <Spinner @isLarge={{true}} />
    {{! END-SNIPPET }}
  </Snippet>
</template>
