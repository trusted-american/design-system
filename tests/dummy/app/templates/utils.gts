import type { TOC } from '@ember/component/template-only';
import { Heading, MainBody, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../components/snippet';
import type UtilsController from '../controllers/utils';

interface UtilsSignature {
  Args: {
    controller: UtilsController;
  };
}

<template>
  {{pageTitle "Utils"}}
  {{breadcrumb "Utils" route="utils"}}

  <MainBody>
    <Heading @title="Utils" />

    <Subheading @title="Check validity" />

    <Snippet @name="util-check-validity.ts" />

    <Subheading @title="File type" />

    <Snippet @name="util-file-type.ts">
      {{@controller.type}}
    </Snippet>

    <Subheading @title="Is valid date" />

    <Snippet @name="util-is-valid-date.ts">
      {{@controller.isValid}}
    </Snippet>
  </MainBody>
</template> satisfies TOC<UtilsSignature>;
