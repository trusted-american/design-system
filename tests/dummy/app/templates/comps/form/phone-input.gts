import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormPhoneInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormPhoneInputController from '../../../controllers/comps/form/phone-input';

export default RouteTemplate<{
  Args: {
    controller: CompsFormPhoneInputController;
  };
}>(
  <template>
    {{pageTitle "Form phone input"}}
    {{breadcrumb "Form phone input" route="comps.form.phone-input"}}

    <Subheading @title="Form phone input" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-phone-input.gts">
      {{! BEGIN-SNIPPET form-phone-input }}
      <FormPhoneInput
        @value={{@controller.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="This is an example of help."
        @invalidFeedback="This is an example of invalid feedback."
        @requiredLabel="Required"
        @onChange={{fn (mut @controller.value)}}
        placeholder="Placeholder"
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
