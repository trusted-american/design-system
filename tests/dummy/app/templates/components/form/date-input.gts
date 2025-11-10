import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import {
  FormDateInput,
  Subheading,
  timestamp,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';

interface ComponentsFormDateInputSignature {
  Args: {};
}

export default class ComponentsFormDateInputController extends Component<ComponentsFormDateInputSignature> {
  value: Date | null = new Date();

  <template>
    {{pageTitle "Date input"}}
    {{breadcrumb "Date input" route="components.form.date-input"}}

    <Subheading @title="Date input" />

    <p>Value: {{timestamp this.value}}</p>

    <Snippet @name="form-date-input.gts">
      {{! BEGIN-SNIPPET form-date-input }}
      <FormDateInput
        @value={{this.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @onChange={{fn (mut this.value)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
