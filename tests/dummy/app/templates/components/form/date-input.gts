import type { TOC } from '@ember/component/template-only';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import {
  FormDateInput,
  Subheading,
  timestamp,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ComponentsFormDateInputController from '../../../controllers/components/form/date-input';

interface ComponentsFormDateInputSignature {
  Args: {
    controller: ComponentsFormDateInputController;
  };
}

<template>
  {{pageTitle "Date input"}}
  {{breadcrumb "Date input" route="components.form.date-input"}}

  <Subheading @title="Date input" />

  <p>Value: {{timestamp @controller.value}}</p>

  <Snippet @name="form-date-input.gts">
    {{! BEGIN-SNIPPET form-date-input }}
    <FormDateInput
      @value={{@controller.value}}
      @label="Label"
      @identifier="identifier"
      @isRequired={{true}}
      @requiredLabel="Required"
      @help="This is an example of help."
      @invalidLabel="This is an example of invalid feedback."
      @onChange={{fn (mut @controller.value)}}
    />
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsFormDateInputSignature>;
