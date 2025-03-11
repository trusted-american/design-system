import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { array, fn, hash } from '@ember/helper';
import { FormRadio, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ComponentsFormRadioCardController from '../../../controllers/components/form/radio-card';

export default RouteTemplate<{
  Args: {
    controller: ComponentsFormRadioCardController;
  };
}>(
  <template>
    {{pageTitle "Radio"}}
    {{breadcrumb "Radio" route="components.form.radio"}}

    <Subheading @title="Radio" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-radio.gts">
      {{! BEGIN-SNIPPET form-radio }}
      <FormRadio
        @options={{array
          (hash value=true label="Yes" help="This is an example of help.")
          (hash value=false label="No" help="This is an example of help.")
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
