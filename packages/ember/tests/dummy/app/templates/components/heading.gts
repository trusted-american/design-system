import { Heading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Heading"}}
  {{breadcrumb "Heading" route="components.heading"}}

  <Heading @title="Heading" />

  <Snippet @name="heading.gts">
    {{! BEGIN-SNIPPET heading }}
    <Heading @title="Title" @type="Type" @identifier="identifier">
      Actions
    </Heading>
    {{! END-SNIPPET }}
  </Snippet>
</template>
