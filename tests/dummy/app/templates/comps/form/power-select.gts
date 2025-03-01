import RouteTemplate from 'ember-route-template';
import Snippet from '../../../components/snippet';
import { array, fn, hash } from '@ember/helper';
import { FormPowerSelect, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsFormPowerSelectController from '../../../controllers/comps/form/power-select';

export default RouteTemplate<{
  Args: {
    controller: CompsFormPowerSelectController;
  };
}>(
  <template>
    {{pageTitle "Form power select"}}
    {{breadcrumb "Form power select" route="comps.form.power-select"}}

    <Subheading @title="Form power select" />

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
        @help="This is an example of help."
        @invalidFeedback="This is an example of invalid feedback."
        @requiredLabel="Required"
        @searchField="subject"
        @chooseLabel="Choose…"
        @searchLabel="Search…"
        @onChange={{fn (mut @controller.value)}}
        as |post|
      >
        {{post.subject}}
      </FormPowerSelect>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
