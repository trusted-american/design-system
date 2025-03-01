import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormFileInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormFileInputController from '../../../controllers/comps/form/file-input';

export default RouteTemplate<{
  Args: {
    controller: CompsFormFileInputController;
  };
}>(
  <template>
    {{pageTitle "Form file input"}}
    {{breadcrumb "Form file input" route="comps.form.file-input"}}

    <Subheading @title="Form file input" />

    <p>Value: {{@controller.value.name}}</p>

    <Snippet @name="form-file-input.gts">
      {{! BEGIN-SNIPPET form-file-input }}
      <FormFileInput
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
