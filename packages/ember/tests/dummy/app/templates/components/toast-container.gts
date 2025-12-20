import type { TOC } from '@ember/component/template-only';
import { Heading, Toast, ToastContainer } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface ToastContainerSignature {
  Args: {
    model: unknown;
    controller: unknown;
  };
}

<template>
  {{pageTitle "Toast container"}}
  {{breadcrumb "Toast container" route="components.toast-container"}}

  <Heading @title="Toast container" />

  <Snippet @name="toast-container.gts">
    {{! BEGIN-SNIPPET toast-container }}
    <ToastContainer>
      <Toast @color="primary" @closeButtonLabel="Close">
        <:body>Primary</:body>
      </Toast>
    </ToastContainer>
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ToastContainerSignature>;
