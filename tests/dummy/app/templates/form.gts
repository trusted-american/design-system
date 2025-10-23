import type { TOC } from '@ember/component/template-only';
import { array, fn } from '@ember/helper';
import { on } from '@ember/modifier';
import {
  Button,
  FormCheck,
  FormInput,
  FormPowerSelect,
  FormTextarea,
  Heading,
  MainBody,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type FormController from '../controllers/form';

interface FormSignature {
  Args: {
    controller: FormController;
  };
}

<template>
  {{pageTitle "Form"}}
  {{breadcrumb "Form" route="form"}}

  <MainBody>
    <Heading @title="Form" />

    <form novalidate {{on "submit" @controller.submit}}>
      <div class="mb-3">
        <FormInput
          @value={{@controller.value}}
          @label="Label"
          @identifier="input"
          @isRequired={{true}}
          @requiredLabel="Required"
          @help="This is an example of help."
          @validLabel="Looks good!"
          @invalidLabel="This is an example of invalid feedback."
          @onChange={{fn (mut @controller.value)}}
          placeholder="Placeholder"
        />
      </div>
      <div class="mb-3">
        <FormTextarea
          @value={{@controller.value}}
          @label="Label"
          @identifier="textarea"
          @isRequired={{true}}
          @requiredLabel="Required"
          @help="This is an example of help."
          @validLabel="Looks good!"
          @invalidLabel="This is an example of invalid feedback."
          @onChange={{fn (mut @controller.value)}}
          placeholder="Placeholder"
        />
      </div>
      <div class="mb-3">
        <FormCheck
          @value={{@controller.check}}
          @label="Label"
          @identifier="check"
          @isRequired={{true}}
          @requiredLabel="Required"
          @help="This is an example of help."
          @validLabel="Looks good!"
          @invalidLabel="This is an example of invalid feedback."
          @onChange={{fn (mut @controller.check)}}
        />
      </div>
      <div class="mb-3">
        <FormPowerSelect
          @options={{array "A" "B" "C"}}
          @selected={{@controller.value}}
          @label="Label"
          @identifier="powerSelect"
          @isRequired={{true}}
          @requiredLabel="Required"
          @help="This is an example of help."
          @validLabel="Looks good!"
          @invalidLabel="This is an example of invalid feedback."
          @chooseLabel="Choose…"
          @searchLabel="Search…"
          @onChange={{fn (mut @controller.value)}}
          as |value|
        >
          {{value}}
        </FormPowerSelect>
      </div>
      <div class="mb-3">
        <FormInput
          @value={{@controller.value}}
          @label="Label"
          @identifier="input"
          @isRequired={{true}}
          @requiredLabel="Required"
          @help="This is an example of help."
          @validLabel="Looks good!"
          @invalidLabel="This is an example of invalid feedback."
          @onChange={{fn (mut @controller.value)}}
          placeholder="Placeholder"
        >
          <:actions>
            <Button @label="Test" />
          </:actions>
        </FormInput>
      </div>
      <Button @type="submit" @label="Submit" @color="primary" />
    </form>
  </MainBody>
</template> satisfies TOC<FormSignature>;
