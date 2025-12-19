import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { FormNumberInput, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormNumberInputRoute from '../../../routes/components/form/number-input';

interface ComponentsFormNumberInputSignature {
  Args: {
    model: ModelFrom<ComponentsFormNumberInputRoute>;
  };
}

export default class ComponentsFormNumberInput extends Component<ComponentsFormNumberInputSignature> {
  value: number | null = null;

  <template>
    {{pageTitle "Number input"}}
    {{breadcrumb "Number input" route="components.form.number-input"}}

    <Subheading @title="Number input" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-number-input.gts">
      {{! BEGIN-SNIPPET form-number-input }}
      <FormNumberInput
        @value={{this.value}}
        @label="Label"
        @id="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @onChange={{fn (mut this.value)}}
        placeholder="Placeholder"
      />
      <hr />
      <FormNumberInput
        @value={{this.value}}
        @type="range"
        @label="Label"
        @id="identifier2"
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
