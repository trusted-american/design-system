import { MainBody, Spinner } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "…"}}
  {{breadcrumb "…"}}

  <MainBody class="flex items-center justify-center">
    <Spinner @isLarge={{true}} />
  </MainBody>
</template>
