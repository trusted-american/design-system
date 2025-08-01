import type { TOC } from '@ember/component/template-only';
import { array, fn } from '@ember/helper';
import {
  FormPowerSelectMultiple,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormPowerSelectMultipleController from '../../../controllers/components/form/power-select-multiple';

interface ComponentsFormPowerSelectMultipleSignature {
  Args: {
    controller: ComponentsFormPowerSelectMultipleController;
  };
}

<template>
  {{pageTitle "Power select multiple"}}
  {{breadcrumb
    "Power select multiple"
    route="components.form.power-select-multiple"
  }}

  <Subheading @title="Power select multiple" />

  <p>
    Value:
    <ul>
      {{#each @controller.value as |post|}}
        <li>{{post.subject}}</li>
      {{/each}}
    </ul>
  </p>

  <Snippet @name="form-power-select-multiple.gts">
    {{! BEGIN-SNIPPET form-power-select-multiple }}
    <FormPowerSelectMultiple
      @options={{(array)}}
      @selected={{@controller.value}}
      @label="Label"
      @identifier="identifier"
      @isRequired={{true}}
      @requiredLabel="Required"
      @help="This is an example of help."
      @invalidLabel="This is an example of invalid feedback."
      {{! TODO: ellipsis }}
      @chooseLabel="Choose..."
      @onChange={{fn (mut @controller.value)}}
      @onCreate={{@controller.create}}
      data-test-state-writing-numbers
      as |post|
    >
      {{post.subject}}
    </FormPowerSelectMultiple>
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsFormPowerSelectMultipleSignature>;
