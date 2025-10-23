import type { TOC } from '@ember/component/template-only';
import { FormFileDropzone, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormFileDropzoneController from '../../../controllers/components/form/file-dropzone';

interface ComponentsFormFileDropzoneSignature {
  Args: {
    controller: ComponentsFormFileDropzoneController;
  };
}

<template>
  {{pageTitle "File dropzone"}}
  {{breadcrumb "File dropzone" route="components.form.file-dropzone"}}

  <Subheading @title="File dropzone" />

  <p>
    Value:
    <ul>
      {{#each @controller.value as |file|}}
        <li>{{file.name}}</li>
      {{/each}}
    </ul>
  </p>

  <Snippet @name="form-file-dropzone.gts">
    {{! BEGIN-SNIPPET form-file-dropzone }}
    <FormFileDropzone
      @titleLabel="Drag and Drop Your Files Here"
      @subtitleLabel="Or select a file from your computer…"
      @activeTitleLabel="Drop to Upload"
      @onCreate={{@controller.create}}
    />
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsFormFileDropzoneSignature>;
