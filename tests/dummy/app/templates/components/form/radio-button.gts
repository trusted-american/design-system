import { array, fn, hash } from '@ember/helper';
import Component from '@glimmer/component';
import { FormRadioButton, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormRadioButtonRoute from '../../../routes/components/form/radio-button';

interface ComponentsFormRadioButtonSignature {
  Args: {
    model: ModelFrom<ComponentsFormRadioButtonRoute>;
  };
}

export default class ComponentsFormRadioButton extends Component<ComponentsFormRadioButtonSignature> {
  value?: boolean;

  <template>
    {{pageTitle "Radio button"}}
    {{breadcrumb "Radio button" route="components.form.radio-button"}}

    <Subheading @title="Radio button" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-radio-button.gts">
      {{! BEGIN-SNIPPET form-radio-button }}
      <FormRadioButton
        @options={{array
          (hash value=true label="Yes")
          (hash value=false label="No")
        }}
        @selected={{this.value}}
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
