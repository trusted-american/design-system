import { Banner, Heading, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Banner"}}
  {{breadcrumb "Banner" route="components.banner"}}

  <Heading @title="Banner" />

  <Subheading @title="Example" />

  <Snippet @name="banner.gts">
    {{! BEGIN-SNIPPET banner }}
    <Banner @color="primary">This is a banner.</Banner>
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Colors" />

  <Snippet @name="banner1.gts">
    {{! BEGIN-SNIPPET banner1 }}
    <Banner @color="primary">Primary</Banner>
    <Banner>Secondary</Banner>
    <Banner @color="success">Success</Banner>
    <Banner @color="danger">Danger</Banner>
    <Banner @color="warning">Warning</Banner>
    <Banner @color="info">Info</Banner>
    <Banner @color="upsell">Upsell</Banner>
    {{! END-SNIPPET }}
  </Snippet>
</template>
