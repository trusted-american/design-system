import { array, fn, hash } from '@ember/helper';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { FormPowerSelect, Subheading } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../../components/snippet';
import type ComponentsFormPowerSelectRoute from '../../../routes/components/form/power-select';

export interface Post {
  subject: string;
  body: string;
}

interface ComponentsFormPowerSelectSignature {
  Args: {
    model: ModelFrom<ComponentsFormPowerSelectRoute>;
  };
}

export default class ComponentsFormPowerSelect extends Component<ComponentsFormPowerSelectSignature> {
  @tracked value?: Post;

  create = () => {
    const subject = prompt('What is the subject?');
    if (subject) {
      this.value = { subject, body: '' };
    }
  };

  <template>
    {{pageTitle "Power select"}}
    {{breadcrumb "Power select" route="components.form.power-select"}}

    <Subheading @title="Power select" />

    <p>Value: {{this.value.subject}}</p>

    <Snippet @name="form-power-select.gts">
      {{! BEGIN-SNIPPET form-power-select }}
      <FormPowerSelect
        @options={{array
          (hash subject="Post A" body="This is the body.")
          (hash subject="Post B" body="This is the body.")
        }}
        @selected={{this.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @requiredLabel="Required"
        @help="This is an example of help."
        @invalidLabel="This is an example of invalid feedback."
        @searchField="subject"
        @chooseLabel="Choose…"
        @searchLabel="Search…"
        @onChange={{fn (mut this.value)}}
        @onCreate={{this.create}}
        as |post|
      >
        {{post.subject}}
      </FormPowerSelect>
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
