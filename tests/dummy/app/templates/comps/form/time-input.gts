import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import {
  FormTimeInput,
  Subheading,
  timestamp,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormTimeInputController from '../../../controllers/comps/form/time-input';

export default RouteTemplate<{
  Args: {
    controller: CompsFormTimeInputController;
  };
}>(
  <template>
    {{pageTitle "Form time input"}}
    {{breadcrumb "Form time input" route="comps.form.time-input"}}

    <Subheading @title="Form time input" />

    <p>Value: {{timestamp @controller.value format="time"}}</p>

    <Snippet @name="form-time-input.gts">
      {{! BEGIN-SNIPPET form-time-input }}
      <FormTimeInput
        @value={{@controller.value}}
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
