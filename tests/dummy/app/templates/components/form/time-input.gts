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

import type ComponentsFormTimeInputController from '../../../controllers/components/form/time-input';

export default RouteTemplate<{
  Args: {
    controller: ComponentsFormTimeInputController;
  };
}>(
  <template>
    {{pageTitle "Time input"}}
    {{breadcrumb "Time input" route="components.form.time-input"}}

    <Subheading @title="Time input" />

    <p>Value: {{timestamp @controller.value format="time"}}</p>

    <Snippet @name="form-time-input.gts">
      {{! BEGIN-SNIPPET form-time-input }}
      <FormTimeInput
        @value={{@controller.value}}
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
