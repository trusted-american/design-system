import { Banner, Heading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Banner"}}
  {{breadcrumb "Banner" route="components.banner"}}

  <Heading @title="Banner" />

  <Snippet @name="banner.gts">
    {{! BEGIN-SNIPPET banner }}
    <Banner @color="primary">
      This is a banner.
    </Banner>
    {{! END-SNIPPET }}
  </Snippet>
</template>
