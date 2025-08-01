import type { TOC } from '@ember/component/template-only';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormHtmlInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ComponentsFormHtmlInputController from '../../../controllers/components/form/html-input';

interface ComponentsFormHtmlInputSignature {
  Args: {
    controller: ComponentsFormHtmlInputController;
  };
}

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
      @requiredLabel="Required"
      @help="This is an example of help."
      @invalidLabel="This is an example of invalid feedback."
      @editorLabel="Editor"
      @codeLabel="Code"
      @onChange={{fn (mut @controller.value)}}
    />
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsFormHtmlInputSignature>;
