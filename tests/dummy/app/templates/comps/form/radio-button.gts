import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { array, fn, hash } from '@ember/helper';
import { FormRadioButton, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormRadioButtonController from '../../../controllers/comps/form/radio-button';

export default RouteTemplate<{
  Args: {
    controller: CompsFormRadioButtonController;
  };
}>(
  <template>
    {{pageTitle "Form radio button"}}
    {{breadcrumb "Form radio button" route="comps.form.radio-button"}}

    <Subheading @title="Form radio button" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-radio-button.gts">
      {{! BEGIN-SNIPPET form-radio-button }}
      <FormRadioButton
        @options={{array
          (hash value=true label="Yes")
          (hash value=false label="No")
        }}
        @selected={{@controller.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="This is an example of help."
        @invalidFeedback="This is an example of invalid feedback."
        @requiredLabel="Required"
        @onChange={{fn (mut @controller.value)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
