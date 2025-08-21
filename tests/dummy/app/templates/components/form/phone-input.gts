import type { TOC } from '@ember/component/template-only';
import { fn } from '@ember/helper';
import { FormPhoneInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormPhoneInputController from '../../../controllers/components/form/phone-input';

interface ComponentsFormPhoneInputSignature {
  Args: {
    controller: ComponentsFormPhoneInputController;
  };
}

<template>
  {{pageTitle "Phone input"}}
  {{breadcrumb "Phone input" route="components.form.phone-input"}}

  <Subheading @title="Phone input" />

  <p class="mb-4">Value: {{@controller.value}}</p>

  <Snippet @name="form-phone-input.gts">
    {{! BEGIN-SNIPPET form-phone-input }}
    <FormPhoneInput
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
</template> satisfies TOC<ComponentsFormPhoneInputSignature>;
