import type { TOC } from '@ember/component/template-only';
import Snippet from '../../../components/snippet';
import { fn } from '@ember/helper';
import { FormNumberInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ComponentsFormNumberInputController from '../../../controllers/components/form/number-input';

interface ComponentsFormNumberInputSignature {
  Args: {
    controller: ComponentsFormNumberInputController;
  };
}

<template>
  {{pageTitle "Number input"}}
  {{breadcrumb "Number input" route="components.form.number-input"}}

  <Subheading @title="Number input" />

  <p>Value: {{@controller.value}}</p>

  <Snippet @name="form-number-input.gts">
    {{! BEGIN-SNIPPET form-number-input }}
    <FormNumberInput
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
    <hr />
    <FormNumberInput
      @value={{@controller.value}}
      @type="range"
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
</template> satisfies TOC<ComponentsFormNumberInputSignature>;
