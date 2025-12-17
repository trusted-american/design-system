import { MainBody } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "Components"}}
  {{breadcrumb "Components" route="components"}}

  <MainBody>
    {{outlet}}
  </MainBody>
</template>
