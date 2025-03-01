import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormTextarea, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormTextareaController from '../../../controllers/comps/form/textarea';

export default RouteTemplate<{
  Args: {
    controller: CompsFormTextareaController;
  };
}>(
  <template>
    {{pageTitle "Form textarea"}}
    {{breadcrumb "Form textarea" route="comps.form.textarea"}}

    <Subheading @title="Form textarea" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-textarea.gts">
      {{! BEGIN-SNIPPET form-textarea }}
      <FormTextarea
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
