import { Heading, Spinner, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Spinner"}}
  {{breadcrumb "Spinner" route="components.spinner"}}

  <Heading @title="Spinner" />

  <Subheading @title="Example" />

  <Snippet @name="spinner.gts">
    {{! BEGIN-SNIPPET spinner }}
    <Spinner @color="primary" @isLarge={{true}} @loadingLabel="Loading…" />
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Colors" />

  <Snippet @name="spinner1.gts">
    {{! BEGIN-SNIPPET spinner1 }}
    <Spinner @color="primary" @loadingLabel="Loading…" />
    <Spinner @loadingLabel="Loading…" />
    <Spinner @color="success" @loadingLabel="Loading…" />
    <Spinner @color="danger" @loadingLabel="Loading…" />
    <Spinner @color="warning" @loadingLabel="Loading…" />
    <Spinner @color="info" @loadingLabel="Loading…" />
    <Spinner @color="upsell" @loadingLabel="Loading…" />
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Sizes" />

  <Snippet @name="spinner2.gts">
    {{! BEGIN-SNIPPET spinner2 }}
    <Spinner @loadingLabel="Loading…" />
    <Spinner @isLarge={{true}} @loadingLabel="Loading…" />
    {{! END-SNIPPET }}
  </Snippet>
</template>
