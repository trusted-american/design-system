import { Copy, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Copy button"}}
  {{breadcrumb "Copy button" route="components.copy"}}

  <Heading @title="Copy button" />

  <Snippet @name="copy-button.gts">
    {{! BEGIN-SNIPPET copy-button }}
    <Copy @value="Copied content">
      Click to copy
    </Copy>
    <Copy @value="Copied content" @isButton={{true}}>
      Click to copy
    </Copy>
    {{! END-SNIPPET }}
  </Snippet>
</template>
