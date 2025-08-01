import {
  Heading,
  ListGroup,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "List group"}}
  {{breadcrumb "List group" route="components.list-group"}}

  <Heading @title="List group" />

  <Subheading @title="Default" />

  <Snippet @name="list-group.gts">
    {{! BEGIN-SNIPPET list-group }}
    <ListGroup as |listGroup|>
      <listGroup.item class="active">An active item</listGroup.item>
      <listGroup.item>A second item</listGroup.item>
      <listGroup.item @route="index">Route</listGroup.item>
      <listGroup.item @href="https://www.google.com/">Href</listGroup.item>
    </ListGroup>
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Disabled" />

  <Snippet @name="list-group1.gts">
    {{! BEGIN-SNIPPET list-group1 }}
    <ListGroup as |listGroup|>
      <listGroup.item class="disabled">A disabled item</listGroup.item>
      <listGroup.item>A second item</listGroup.item>
    </ListGroup>
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Flush" />

  <Snippet @name="list-group2.gts">
    {{! BEGIN-SNIPPET list-group2 }}
    <ListGroup @isFlush={{true}} as |listGroup|>
      <listGroup.item>An item</listGroup.item>
    </ListGroup>
    {{! END-SNIPPET }}
  </Snippet>
</template>
