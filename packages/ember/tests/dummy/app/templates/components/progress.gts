import { Heading, Progress, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Progress"}}
  {{breadcrumb "Progress" route="components.progress"}}

  <Heading @title="Progress" />

  <Subheading @title="Examples" />

  <Snippet @name="progress.gts">
    {{! BEGIN-SNIPPET progress }}
    <Progress as |progress|>
      <progress.bar @value={{0.5}} />
    </Progress>
    <Progress as |progress|>
      <progress.bar @value={{0.5}} @color="secondary" />
    </Progress>
    <Progress as |progress|>
      <progress.bar @value={{0.5}} @color="success" />
    </Progress>
    <Progress as |progress|>
      <progress.bar @value={{0.5}} @color="danger" />
    </Progress>
    <Progress as |progress|>
      <progress.bar @value={{0.5}} @color="warning" />
    </Progress>
    <Progress as |progress|>
      <progress.bar @value={{0.5}} @color="info" />
    </Progress>
    <Progress as |progress|>
      <progress.bar @value={{0.5}} @color="upsell" />
    </Progress>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="progress1.gts">
    {{! BEGIN-SNIPPET progress1 }}
    <Progress as |progress|>
      <progress.bar @value={{0.3}} @color="danger" />
      <progress.bar @value={{0.3}} @color="warning" />
      <progress.bar @value={{0.3}} @color="success" />
    </Progress>
    {{! END-SNIPPET }}
  </Snippet>
</template>
