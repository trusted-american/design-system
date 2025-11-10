import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { ButtonSet, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface ComponentsButtonSetSignature {
  Args: {};
}

export default class ComponentsButtonSet extends Component<ComponentsButtonSetSignature> {
  click = () => {
    alert('Action');
  };

  <template>
    {{pageTitle "Button set"}}
    {{breadcrumb "Button set" route="components.button-set"}}

    <Heading @title="Button set" />

    <Snippet @name="button-set.gts">
      {{! BEGIN-SNIPPET button-set }}
      <ButtonSet as |buttonSet|>
        <buttonSet.button @label="Button 1" {{on "click" this.click}} />
        <buttonSet.button @label="Button 2" {{on "click" this.click}} />
      </ButtonSet>
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
