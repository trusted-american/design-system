import { faCheck } from '@fortawesome/free-solid-svg-icons';
import { Badge, Heading, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Badge"}}
  {{breadcrumb "Badge" route="components.badge"}}

  <Heading @title="Badge" />

  <Subheading @title="Examples" />

  {{! TODO: index }}
  <Snippet @name="badge.gts">
    {{! BEGIN-SNIPPET badge }}
    <Badge @label="Primary" @color="primary" />
    <Badge @label="Secondary" />
    <Badge @label="Success" @color="success" />
    <Badge @label="Danger" @color="danger" />
    <Badge @label="Warning" @color="warning" />
    <Badge @label="Info" @color="info" />
    <Badge @label="Upsell" @color="upsell" />
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="badge1.gts">
    {{! BEGIN-SNIPPET badge1 }}
    <Badge @label="Default badge" />
    <Badge @label="Success badge" @color="success" />
    <Badge
      @label="Success badge with icon"
      @color="success"
      @icon={{faCheck}}
    />
    <Badge @label="Loading badge" @isLoading={{true}} />
    {{! END-SNIPPET }}
  </Snippet>
</template>
