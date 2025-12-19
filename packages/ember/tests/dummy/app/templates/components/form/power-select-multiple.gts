import { array, fn } from '@ember/helper';
import Component from '@glimmer/component';
import { FormPowerSelectMultiple, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type { Post } from './power-select';
import type ComponentsFormPowerSelectMultipleRoute from '../../../routes/components/form/power-select-multiple';

interface ComponentsFormPowerSelectMultipleSignature {
  Args: {
    model: ModelFrom<ComponentsFormPowerSelectMultipleRoute>;
  };
}

export default class ComponentsFormPowerSelectMultiple extends Component<ComponentsFormPowerSelectMultipleSignature> {
  value: Post[] = [];

  create = () => {
    alert('Action');
  };

  <template>
    {{pageTitle "Power select multiple"}}
    {{breadcrumb
      "Power select multiple"
      route="components.form.power-select-multiple"
    }}

    <Subheading @title="Power select multiple" />

    <p>
      Value:
      <ul>
        {{#each this.value as |post|}}
          <li>{{post.subject}}</li>
        {{/each}}
      </ul>
    </p>

    <Snippet @name="form-power-select-multiple.gts">
      {{! BEGIN-SNIPPET form-power-select-multiple }}
      <FormPowerSelectMultiple
        @options={{(array)}}
        @selected={{this.value}}
        @label="Label"
        @id="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @chooseLabel="Choose…"
        @onChange={{fn (mut this.value)}}
        @onCreate={{this.create}}
        data-test-state-writing-numbers
        as |post|
      >
        {{post.subject}}
      </FormPowerSelectMultiple>
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
