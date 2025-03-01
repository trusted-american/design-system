import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormCheck, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormCheckController from '../../../controllers/comps/form/check';

export default RouteTemplate<{
  Args: {
    controller: CompsFormCheckController;
  };
}>(
  <template>
    {{pageTitle "Form check"}}
    {{breadcrumb "Form check" route="comps.form.check"}}

    <Subheading @title="Form check" />

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
) as TemplateFactory;
