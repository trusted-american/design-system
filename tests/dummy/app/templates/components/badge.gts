import { faCheck } from '@fortawesome/free-solid-svg-icons';
import { Badge, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Badge"}}
  {{breadcrumb "Badge" route="components.badge"}}

  <Heading @title="Badge" />

  <Snippet @name="badge.gts">
    {{! BEGIN-SNIPPET badge }}
    <Badge @label="Default badge" class="me-2" />
    <Badge @label="Success badge" @color="success" class="me-2" />
    <Badge
      @label="Success badge with icon"
      @color="success"
      @icon={{faCheck}}
      class="me-2"
    />
    <Badge @label="Loading badge" @isLoading={{true}} class="me-2" />
    {{! END-SNIPPET }}
  </Snippet>
</template>
