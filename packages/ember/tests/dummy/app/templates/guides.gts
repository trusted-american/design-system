import { MainBody } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "Guides"}}
  {{breadcrumb "Guides" route="guides"}}

  <MainBody>
    {{outlet}}
  </MainBody>
</template>
