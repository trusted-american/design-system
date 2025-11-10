import { array, fn, hash } from '@ember/helper';
import Component from '@glimmer/component';
import { faCheck, faXmark } from '@fortawesome/free-solid-svg-icons';
import { FormRadioCard, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';

interface ComponentsFormRadioCardSignature {
  Args: {};
}

export default class ComponentsFormRadioCard extends Component<ComponentsFormRadioCardSignature> {
  value?: boolean;

  <template>
    {{pageTitle "Radio card"}}
    {{breadcrumb "Radio card" route="components.form.radio-card"}}

    <Subheading @title="Radio card" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-radio-card.gts">
      {{! BEGIN-SNIPPET form-radio-card }}
      <FormRadioCard
        @options={{array
          (hash
            value=true label="Yes" help="This is an example of help." icon=faCheck
          )
          (hash
            value=false label="No" help="This is an example of help." icon=faXmark
          )
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
