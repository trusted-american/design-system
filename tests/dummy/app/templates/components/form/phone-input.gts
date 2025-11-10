import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { FormPhoneInput, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormPhoneInputRoute from '../../../routes/components/form/phone-input';

interface ComponentsFormPhoneInputSignature {
  Args: {
    model: ModelFrom<ComponentsFormPhoneInputRoute>;
  };
}

export default class ComponentsFormPhoneInput extends Component<ComponentsFormPhoneInputSignature> {
  value?: string | null | undefined;

  <template>
    {{pageTitle "Phone input"}}
    {{breadcrumb "Phone input" route="components.form.phone-input"}}

    <Subheading @title="Phone input" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-phone-input.gts">
      {{! BEGIN-SNIPPET form-phone-input }}
      <FormPhoneInput
        @value={{this.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @onChange={{fn (mut this.value)}}
        placeholder="Placeholder"
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
