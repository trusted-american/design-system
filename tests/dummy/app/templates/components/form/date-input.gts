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

import type ComponentsFormDateInputController from '../../../controllers/components/form/date-input';

export default RouteTemplate<{
  Args: {
    controller: ComponentsFormDateInputController;
  };
}>(
  <template>
    {{pageTitle "Date input"}}
    {{breadcrumb "Date input" route="components.form.date-input"}}

    <Subheading @title="Date input" />

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
);
