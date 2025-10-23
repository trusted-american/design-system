import type { TOC } from '@ember/component/template-only';
import { array, fn, hash } from '@ember/helper';
import { FormPowerSelect, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormPowerSelectController from '../../../controllers/components/form/power-select';

interface ComponentsFormPowerSelectSignature {
  Args: {
    controller: ComponentsFormPowerSelectController;
  };
}

<template>
  {{pageTitle "Power select"}}
  {{breadcrumb "Power select" route="components.form.power-select"}}

  <Subheading @title="Power select" />

  <p>Value: {{@controller.value.subject}}</p>

  <Snippet @name="form-power-select.gts">
    {{! BEGIN-SNIPPET form-power-select }}
    <FormPowerSelect
      @options={{array
        (hash subject="Post A" body="This is the body.")
        (hash subject="Post B" body="This is the body.")
      }}
      @selected={{@controller.value}}
      @label="Label"
      @identifier="identifier"
      @isRequired={{true}}
      @requiredLabel="Required"
      @help="This is an example of help."
      @invalidLabel="This is an example of invalid feedback."
      @searchField="subject"
      @chooseLabel="Choose…"
      @searchLabel="Search…"
      @onChange={{fn (mut @controller.value)}}
      @onCreate={{@controller.create}}
      as |post|
    >
      {{post.subject}}
    </FormPowerSelect>
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsFormPowerSelectSignature>;
