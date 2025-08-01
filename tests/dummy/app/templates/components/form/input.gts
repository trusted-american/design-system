import type { TOC } from '@ember/component/template-only';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ComponentsFormInputController from '../../../controllers/components/form/input';

interface ComponentsFormInputSignature {
  Args: {
    controller: ComponentsFormInputController;
  };
}

<template>
  {{pageTitle "Input"}}
  {{breadcrumb "Input" route="components.form.input"}}

  <Subheading @title="Input" />

  <p>Value: {{@controller.value}}</p>

  <Snippet @name="form-input.gts">
    {{! BEGIN-SNIPPET form-input }}
    <FormInput
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
</template> satisfies TOC<ComponentsFormInputSignature>;
