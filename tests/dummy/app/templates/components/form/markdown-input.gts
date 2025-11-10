import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { FormMarkdownInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormMarkdownInputRoute from '../../../routes/components/form/markdown-input';

interface ComponentsFormMarkdownInputSignature {
  Args: {
    model: ModelFrom<ComponentsFormMarkdownInputRoute>;
  };
}

export default class ComponentsFormMarkdownInput extends Component<ComponentsFormMarkdownInputSignature> {
  value: string | null = null;

  <template>
    {{pageTitle "Markdown input"}}
    {{breadcrumb "Markdown input" route="components.form.markdown-input"}}

    <Subheading @title="Markdown input" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-markdown-input.gts">
      {{! BEGIN-SNIPPET form-markdown-input }}
      <FormMarkdownInput
        @value={{this.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @writeLabel="Write"
        @previewLabel="Preview"
        @headingLabel="Heading"
        @boldLabel="Bold"
        @italicLabel="Italic"
        @codeLabel="Code"
        @linkLabel="Link"
        @numberedListLabel="Numbered list"
        @unorderedListLabel="Unordered list"
        @onChange={{fn (mut this.value)}}
        placeholder="Add your comment here…"
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
