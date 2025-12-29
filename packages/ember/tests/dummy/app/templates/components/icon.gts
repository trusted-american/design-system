import { faFlag } from '@fortawesome/free-solid-svg-icons';
import { Heading, Icon, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Icon"}}
  {{breadcrumb "Icon" route="components.icon"}}

  <Heading @title="Icon" />

  <Subheading @title="Example" />

  <Snippet @name="icon.gts">
    {{! BEGIN-SNIPPET icon }}
    <Icon @icon={{faFlag}} @color="primary" @size="xl" @isFixedWidth={{true}} />
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Colors" />

  <Snippet @name="icon1.gts">
    {{! BEGIN-SNIPPET icon1 }}
    <Icon @icon={{faFlag}} @color="primary" />
    <Icon @icon={{faFlag}} @color="secondary" />
    <Icon @icon={{faFlag}} @color="success" />
    <Icon @icon={{faFlag}} @color="danger" />
    <Icon @icon={{faFlag}} @color="warning" />
    <Icon @icon={{faFlag}} @color="info" />
    <Icon @icon={{faFlag}} @color="upsell" />
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Sizes" />

  <Snippet @name="icon2.gts">
    {{! BEGIN-SNIPPET icon2 }}
    <Icon @icon={{faFlag}} @size="2xs" />
    <Icon @icon={{faFlag}} @size="xs" />
    <Icon @icon={{faFlag}} @size="sm" />
    <Icon @icon={{faFlag}} />
    <Icon @icon={{faFlag}} @size="lg" />
    <Icon @icon={{faFlag}} @size="xl" />
    <Icon @icon={{faFlag}} @size="2xl" />
    {{! END-SNIPPET }}
  </Snippet>
</template>
