import type { TOC } from '@ember/component/template-only';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormMarkdownInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ComponentsFormMarkdownInputController from '../../../controllers/components/form/markdown-input';

interface ComponentsFormMarkdownInputSignature {
  Args: {
    controller: ComponentsFormMarkdownInputController;
  };
}

<template>
  {{pageTitle "Markdown input"}}
  {{breadcrumb "Markdown input" route="components.form.markdown-input"}}

  <Subheading @title="Markdown input" />

  <p>Value: {{@controller.value}}</p>

  <Snippet @name="form-markdown-input.gts">
    {{! BEGIN-SNIPPET form-markdown-input }}
    <FormMarkdownInput
      @value={{@controller.value}}
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
      @onChange={{fn (mut @controller.value)}}
      {{! TODO: ellipsis }}
      placeholder="Add your comment here..."
    />
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsFormMarkdownInputSignature>;
