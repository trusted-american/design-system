import { ButtonGroup, Heading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Button group"}}
  {{breadcrumb "Button group" route="components.button-group"}}

  <Heading @title="Button group" />

  <Snippet @name="button-group.gts">
    {{! BEGIN-SNIPPET button-group }}
    <ButtonGroup as |buttonGroup|>
      <buttonGroup.button @label="First" />
      <buttonGroup.button @label="Second" />
    </ButtonGroup>
    {{! END-SNIPPET }}
  </Snippet>
</template>
