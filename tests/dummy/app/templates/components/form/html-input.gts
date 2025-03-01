import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormHtmlInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type ComponentsFormHtmlInputController from '../../../controllers/components/form/html-input';

export default RouteTemplate<{
  Args: {
    controller: ComponentsFormHtmlInputController;
  };
}>(
  <template>
    {{pageTitle "HTML input"}}
    {{breadcrumb "HTML input" route="components.form.html-input"}}

    <Subheading @title="HTML input" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-html-input.gts">
      {{! BEGIN-SNIPPET form-html-input }}
      <FormHtmlInput
        @value={{@controller.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="This is an example of help."
        @invalidFeedback="This is an example of invalid feedback."
        @requiredLabel="Required"
        @editorLabel="Editor"
        @codeLabel="Code"
        @onChange={{fn (mut @controller.value)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
