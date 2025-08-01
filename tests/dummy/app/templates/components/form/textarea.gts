import type { TOC } from '@ember/component/template-only';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormTextarea, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ComponentsFormTextareaController from '../../../controllers/components/form/textarea';

interface ComponentsFormTextareaSignature {
  Args: {
    controller: ComponentsFormTextareaController;
  };
}

<template>
  {{pageTitle "Textarea"}}
  {{breadcrumb "Textarea" route="components.form.textarea"}}

  <Subheading @title="Textarea" />

  <p>Value: {{@controller.value}}</p>

  <Snippet @name="form-textarea.gts">
    {{! BEGIN-SNIPPET form-textarea }}
    <FormTextarea
      @value={{@controller.value}}
      @label="Label"
      @identifier="identifier"
      @isRequired={{true}}
      @requiredLabel="Required"
      @help="This is an example of help."
      @invalidLabel="This is an example of invalid feedback."
      @onChange={{fn (mut @controller.value)}}
      placeholder="Placeholder"
    />
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsFormTextareaSignature>;
