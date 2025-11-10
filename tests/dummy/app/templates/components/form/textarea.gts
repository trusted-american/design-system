import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { FormTextarea, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormTextareaRoute from '../../../routes/components/form/textarea';

interface ComponentsFormTextareaSignature {
  Args: {
    model: ModelFrom<ComponentsFormTextareaRoute>;
  };
}

export default class ComponentsFormTextarea extends Component<ComponentsFormTextareaSignature> {
  value = '';

  <template>
    {{pageTitle "Textarea"}}
    {{breadcrumb "Textarea" route="components.form.textarea"}}

    <Subheading @title="Textarea" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-textarea.gts">
      {{! BEGIN-SNIPPET form-textarea }}
      <FormTextarea
        @value={{this.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @onChange={{fn (mut this.value)}}
        placeholder="Placeholder"
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
