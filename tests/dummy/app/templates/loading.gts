import { MainBody, Spinner } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "…"}}
  {{breadcrumb "…"}}

  <MainBody class="d-flex align-items-center justify-content-center">
    <Spinner @isLarge={{true}} />
  </MainBody>
</template>
