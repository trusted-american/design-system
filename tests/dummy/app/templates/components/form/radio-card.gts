import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { array, fn, hash } from '@ember/helper';
import { FormRadioCard, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ComponentsFormRadioCardController from '../../../controllers/components/form/radio-card';

export default RouteTemplate<{
  Args: {
    controller: ComponentsFormRadioCardController;
  };
}>(
  <template>
    {{pageTitle "Radio card"}}
    {{breadcrumb "Radio card" route="components.form.radio-card"}}

    <Subheading @title="Radio card" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-radio-card.gts">
      {{! BEGIN-SNIPPET form-radio-card }}
      <FormRadioCard
        @options={{array
          (hash
            value=true
            label="Yes"
            help="This is an example of help."
            icon="check"
          )
          (hash
            value=false
            label="No"
            help="This is an example of help."
            icon="xmark"
          )
        }}
        @selected={{@controller.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @onChange={{fn (mut @controller.value)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
