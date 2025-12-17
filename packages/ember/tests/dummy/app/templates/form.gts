import { array, fn } from '@ember/helper';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import Component from '@glimmer/component';
import {
  Button,
  FormCheck,
  FormInput,
  FormPowerSelect,
  FormTextarea,
  Heading,
  MainBody,
} from '@trusted-american/ember';
import checkValidity from '@trusted-american/ember/utils/check-validity';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type FormRoute from '../routes/form';

interface FormSignature {
  Args: {
    model: ModelFrom<FormRoute>;
  };
}

export default class Form extends Component<FormSignature> {
  value?: string;
  check = false;

  @action
  @checkValidity
  submit() {
    alert('Success');
  }

  <template>
    {{pageTitle "Form"}}
    {{breadcrumb "Form" route="form"}}

    <MainBody>
      <Heading @title="Form" />

      <form novalidate {{on "submit" this.submit}}>
        <div class="mb-3">
          <FormInput
            @value={{this.value}}
            @label="Label"
            @identifier="input"
            @isRequired={{true}}
            @requiredLabel="Required"
            @help="This is an example of help."
            @validLabel="Looks good!"
            @invalidLabel="This is an example of invalid feedback."
            @onChange={{fn (mut this.value)}}
            placeholder="Placeholder"
          />
        </div>
        <div class="mb-3">
          <FormTextarea
            @value={{this.value}}
            @label="Label"
            @identifier="textarea"
            @isRequired={{true}}
            @requiredLabel="Required"
            @help="This is an example of help."
            @validLabel="Looks good!"
            @invalidLabel="This is an example of invalid feedback."
            @onChange={{fn (mut this.value)}}
            placeholder="Placeholder"
          />
        </div>
        <div class="mb-3">
          <FormCheck
            @value={{this.check}}
            @label="Label"
            @identifier="check"
            @isRequired={{true}}
            @requiredLabel="Required"
            @help="This is an example of help."
            @validLabel="Looks good!"
            @invalidLabel="This is an example of invalid feedback."
            @onChange={{fn (mut this.check)}}
          />
        </div>
        <div class="mb-3">
          <FormPowerSelect
            @options={{array "A" "B" "C"}}
            @selected={{this.value}}
            @label="Label"
            @identifier="powerSelect"
            @isRequired={{true}}
            @requiredLabel="Required"
            @help="This is an example of help."
            @validLabel="Looks good!"
            @invalidLabel="This is an example of invalid feedback."
            @chooseLabel="Choose…"
            @searchLabel="Search…"
            @onChange={{fn (mut this.value)}}
            as |value|
          >
            {{value}}
          </FormPowerSelect>
        </div>
        <div class="mb-3">
          <FormInput
            @value={{this.value}}
            @label="Label"
            @identifier="input"
            @isRequired={{true}}
            @requiredLabel="Required"
            @help="This is an example of help."
            @validLabel="Looks good!"
            @invalidLabel="This is an example of invalid feedback."
            @onChange={{fn (mut this.value)}}
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
  </template>
}
