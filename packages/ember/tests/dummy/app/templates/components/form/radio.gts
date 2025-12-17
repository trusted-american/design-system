import { array, fn, hash } from '@ember/helper';
import Component from '@glimmer/component';
import { FormRadio, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormRadioRoute from '../../../routes/components/form/radio';

interface ComponentsFormRadioSignature {
  Args: {
    model: ModelFrom<ComponentsFormRadioRoute>;
  };
}

export default class ComponentsFormRadio extends Component<ComponentsFormRadioSignature> {
  value?: boolean;

  <template>
    {{pageTitle "Radio"}}
    {{breadcrumb "Radio" route="components.form.radio"}}

    <Subheading @title="Radio" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-radio.gts">
      {{! BEGIN-SNIPPET form-radio }}
      <FormRadio
        @options={{array
          (hash value=true label="Yes" help="This is an example of help.")
          (hash value=false label="No" help="This is an example of help.")
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
