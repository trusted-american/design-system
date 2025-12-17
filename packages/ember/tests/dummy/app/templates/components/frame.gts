import { Frame, Heading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Frame"}}
  {{breadcrumb "Frame" route="components.frame"}}

  <Heading @title="Frame" />

  <Snippet @name="frame.gts">
    {{! BEGIN-SNIPPET frame }}
    <Frame>
      Content
    </Frame>
    {{! END-SNIPPET }}
  </Snippet>
</template>
