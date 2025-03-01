import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { array, fn, hash } from '@ember/helper';
import { FormRadioCard, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type ComponentsFormRadioCardController from '../../../controllers/components/form/radio-card';

export default RouteTemplate<{
  Args: {
    controller: ComponentsFormRadioCardController;
  };
}>(
  <template>
    {{pageTitle "Form radio card"}}
    {{breadcrumb "Form radio card" route="components.form.radio-card"}}

    <Subheading @title="Form radio card" />

    <p>Value: {{@controller.value}}</p>

    <Snippet @name="form-radio-card.gts">
      {{! BEGIN-SNIPPET form-radio-card }}
      <FormRadioCard
        @options={{array
          (hash
            value=true
            label="Yes"
            icon="check"
            help="This is an example of help."
          )
          (hash
            value=false
            label="No"
            icon="xmark"
            help="This is an example of help."
          )
        }}
        @selected={{@controller.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="This is an example of help."
        @invalidFeedback="This is an example of invalid feedback."
        @requiredLabel="Required"
        @onChange={{fn (mut @controller.value)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
