import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import {
  FormDateInput,
  Subheading,
  timestamp,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormDateInputController from '../../../controllers/comps/form/date-input';

export default RouteTemplate<{
  Args: {
    controller: CompsFormDateInputController;
  };
}>(
  <template>
    {{pageTitle "Form date input"}}
    {{breadcrumb "Form date input" route="comps.form.date-input"}}

    <Subheading @title="Form date input" />

    <p>Value: {{timestamp @controller.value}}</p>

    <Snippet @name="form-date-input.gts">
      {{! BEGIN-SNIPPET form-date-input }}
      <FormDateInput
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
