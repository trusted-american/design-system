import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ComponentsFormInputController from '../../../controllers/components/form/input';

export default RouteTemplate<{
  Args: {
    controller: ComponentsFormInputController;
  };
}>(
  <template>
    {{pageTitle "Input"}}
    {{breadcrumb "Input" route="components.form.input"}}

    <Subheading @title="Input" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-input.gts">
      {{! BEGIN-SNIPPET form-input }}
      <FormInput
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
);
