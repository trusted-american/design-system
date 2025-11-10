import { array, fn, hash } from '@ember/helper';
import Component from '@glimmer/component';
import { FormSelect, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';

interface ComponentsFormSelectSignature {
  Args: {};
}

export default class ComponentsFormSelect extends Component<ComponentsFormSelectSignature> {
  value?: 'active' | 'inactive' | 'third' | 'fourth' | 'fifth';

  <template>
    {{pageTitle "Select"}}
    {{breadcrumb "Select" route="components.form.select"}}

    <Subheading @title="Select" />

    <p>Value: {{this.value}}</p>

    <Snippet @name="form-select.gts">
      {{! BEGIN-SNIPPET form-select }}
      <FormSelect
        @options={{array
          (hash value=undefined label="Choose…")
          (hash value="active" label="Active")
          (hash value="inactive" label="Inactive")
          (hash
            groupLabel="Label"
            options=(array
              (hash value="third" label="Third")
              (hash value="fourth" label="Fourth")
            )
          )
          "fifth"
        }}
        @selected={{this.value}}
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
