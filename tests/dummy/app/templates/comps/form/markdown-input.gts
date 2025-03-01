import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormMarkdownInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormMarkdownInputController from '../../../controllers/comps/form/markdown-input';

export default RouteTemplate<{
  Args: {
    controller: CompsFormMarkdownInputController;
  };
}>(
  <template>
    {{pageTitle "Form Markdown input"}}
    {{breadcrumb "Form Markdown input" route="comps.form.markdown-input"}}

    <Subheading @title="Form Markdown input" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-markdown-input.gts">
      {{! BEGIN-SNIPPET form-markdown-input }}
      <FormMarkdownInput
        @value={{@controller.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="This is an example of help."
        @invalidFeedback="This is an example of invalid feedback."
        @requiredLabel="Required"
        @writeLabel="Write"
        @previewLabel="Preview"
        @headingLabel="Heading"
        @boldLabel="Bold"
        @italicLabel="Italic"
        @codeLabel="Code"
        @linkLabel="Link"
        @numberedListLabel="Numbered list"
        @unorderedListLabel="Unordered list"
        @onChange={{fn (mut @controller.value)}}
        placeholder="Add your comment here…"
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
