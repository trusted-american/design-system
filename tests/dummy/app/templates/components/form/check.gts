import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { FormCheck, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';

interface ComponentsFormCheckSignature {
  Args: {};
}

export default class ComponentsFormCheck extends Component<ComponentsFormCheckSignature> {
  value = false;

  <template>
    {{pageTitle "Check"}}
    {{breadcrumb "Check" route="components.form.check"}}

    <Subheading @title="Check" />

    <p>Value: {{if this.value "True" " False"}}</p>

    <Snippet @name="form-check.gts">
      {{! BEGIN-SNIPPET form-check }}
      <FormCheck
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
