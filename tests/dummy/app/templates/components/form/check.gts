import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormCheck, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ComponentsFormCheckController from '../../../controllers/components/form/check';

export default RouteTemplate<{
  Args: {
    controller: ComponentsFormCheckController;
  };
}>(
  <template>
    {{pageTitle "Check"}}
    {{breadcrumb "Check" route="components.form.check"}}

    <Subheading @title="Check" />

    <p>Value: {{if @controller.value "True" " False"}}</p>

    <Snippet @name="form-check.gts">
      {{! BEGIN-SNIPPET form-check }}
      <FormCheck
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
