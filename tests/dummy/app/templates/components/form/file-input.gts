import type { TOC } from '@ember/component/template-only';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormFileInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ComponentsFormFileInputController from '../../../controllers/components/form/file-input';

interface ComponentsFormFileInputSignature {
  Args: {
    controller: ComponentsFormFileInputController;
  };
}

<template>
  {{pageTitle "File input"}}
  {{breadcrumb "File input" route="components.form.file-input"}}

  <Subheading @title="File input" />

  <p>Value: {{@controller.value.name}}</p>

  <Snippet @name="form-file-input.gts">
    {{! BEGIN-SNIPPET form-file-input }}
    <FormFileInput
      @label="Label"
      @identifier="identifier"
      @isRequired={{true}}
      @requiredLabel="Required"
      @help="This is an example of help."
      @invalidLabel="This is an example of invalid feedback."
      @onChange={{fn (mut @controller.value)}}
    />
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsFormFileInputSignature>;
