import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormNumberInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormNumberInputController from '../../../controllers/comps/form/number-input';

export default RouteTemplate<{
  Args: {
    controller: CompsFormNumberInputController;
  };
}>(
  <template>
    {{pageTitle "Form number input"}}
    {{breadcrumb "Form number input" route="comps.form.number-input"}}

    <Subheading @title="Form number input" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-number-input.gts">
      {{! BEGIN-SNIPPET form-number-input }}
      <FormNumberInput
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
      <hr />
      <FormNumberInput
        @value={{@controller.value}}
        @type="range"
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
