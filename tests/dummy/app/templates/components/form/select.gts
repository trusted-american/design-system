import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { array, fn, hash } from '@ember/helper';
import { FormSelect, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ComponentsFormSelectController from '../../../controllers/components/form/select';

export default RouteTemplate<{
  Args: {
    controller: ComponentsFormSelectController;
  };
}>(
  <template>
    {{pageTitle "Select"}}
    {{breadcrumb "Select" route="components.form.select"}}

    <Subheading @title="Select" />

    <p>Value: {{@controller.value}}</p>

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
        @selected={{@controller.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @requiredLabel="Required"
        @onChange={{fn (mut @controller.value)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
