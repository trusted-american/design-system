import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { FormFileDropzone, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';

interface ComponentsFormFileDropzoneSignature {
  Args: {};
}

export default class ComponentsFormFileDropzone extends Component<ComponentsFormFileDropzoneSignature> {
  @tracked value: File[] = [];

  create = (file: File) => {
    this.value = [...this.value, file];
  };

  <template>
    {{pageTitle "File dropzone"}}
    {{breadcrumb "File dropzone" route="components.form.file-dropzone"}}

    <Subheading @title="File dropzone" />

    <p>
      Value:
      <ul>
        {{#each this.value as |file|}}
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
        @onCreate={{this.create}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
