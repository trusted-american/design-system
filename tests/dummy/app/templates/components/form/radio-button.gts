import type { TOC } from '@ember/component/template-only';
import Snippet from '../../../components/snippet';
import { array, fn, hash } from '@ember/helper';
import { FormRadioButton, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ComponentsFormRadioButtonController from '../../../controllers/components/form/radio-button';

interface ComponentsFormRadioButtonSignature {
  Args: {
    controller: ComponentsFormRadioButtonController;
  };
}

<template>
  {{pageTitle "Radio button"}}
  {{breadcrumb "Radio button" route="components.form.radio-button"}}

  <Subheading @title="Radio button" />

  <p>Value: {{@controller.value}}</p>

  <Snippet @name="form-radio-button.gts">
    {{! BEGIN-SNIPPET form-radio-button }}
    <FormRadioButton
      @options={{array
        (hash value=true label="Yes")
        (hash value=false label="No")
      }}
      @selected={{@controller.value}}
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
</template> satisfies TOC<ComponentsFormRadioButtonSignature>;
