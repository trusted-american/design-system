import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { FormTimeInput, Subheading, timestamp } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormTimeInputRoute from '../../../routes/components/form/time-input';

interface ComponentsFormTimeInputSignature {
  Args: {
    model: ModelFrom<ComponentsFormTimeInputRoute>;
  };
}

export default class ComponentsFormTimeInput extends Component<ComponentsFormTimeInputSignature> {
  value: Date | null = new Date();

  <template>
    {{pageTitle "Time input"}}
    {{breadcrumb "Time input" route="components.form.time-input"}}

    <Subheading @title="Time input" />

    <p>Value: {{timestamp this.value format="time"}}</p>

    <Snippet @name="form-time-input.gts">
      {{! BEGIN-SNIPPET form-time-input }}
      <FormTimeInput
        @value={{this.value}}
        @label="Label"
        @id="identifier"
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
