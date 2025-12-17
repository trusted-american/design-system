import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { FormInput, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormInputRoute from '../../../routes/components/form/input';

interface ComponentsFormInputSignature {
  Args: {
    model: ModelFrom<ComponentsFormInputRoute>;
  };
}

export default class ComponentsFormInput extends Component<ComponentsFormInputSignature> {
  value = '';

  <template>
    {{pageTitle "Input"}}
    {{breadcrumb "Input" route="components.form.input"}}

    <Subheading @title="Input" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-input.gts">
      {{! BEGIN-SNIPPET form-input }}
      <FormInput
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
