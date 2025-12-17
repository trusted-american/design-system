import { Heading, MainBody } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "Not Found"}}
  {{breadcrumb "Not Found" route="not-found"}}

  <MainBody>
    <Heading @title="Not Found" />
  </MainBody>
</template>
