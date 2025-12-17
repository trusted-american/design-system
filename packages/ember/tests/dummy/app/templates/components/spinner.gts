import { Heading, Spinner } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Spinner"}}
  {{breadcrumb "Spinner" route="components.spinner"}}

  <Heading @title="Spinner" />

  <Snippet @name="spinner.gts">
    {{! BEGIN-SNIPPET spinner }}
    <Spinner />
    <Spinner @color="secondary" />
    <Spinner @isLarge={{true}} />
    {{! END-SNIPPET }}
  </Snippet>
</template>
