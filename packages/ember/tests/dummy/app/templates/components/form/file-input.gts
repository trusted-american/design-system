import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { FormFileInput, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormFileInputRoute from '../../../routes/components/form/file-input';

interface ComponentsFormFileInputSignature {
  Args: {
    model: ModelFrom<ComponentsFormFileInputRoute>;
  };
}

export default class ComponentsFormFileInput extends Component<ComponentsFormFileInputSignature> {
  value?: File;

  <template>
    {{pageTitle "File input"}}
    {{breadcrumb "File input" route="components.form.file-input"}}

    <Subheading @title="File input" />

    <p>Value: {{this.value.name}}</p>

    <Snippet @name="form-file-input.gts">
      {{! BEGIN-SNIPPET form-file-input }}
      <FormFileInput
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @onChange={{fn (mut this.value)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
