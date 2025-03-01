import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { on } from '@ember/modifier';
import { Button, ButtonSet, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type ComponentsButtonSetController from '../../controllers/components/button-set';

export default RouteTemplate<{
  Args: {
    controller: ComponentsButtonSetController;
  };
}>(
  <template>
    {{pageTitle "Button set"}}
    {{breadcrumb "Button set" route="components.button-set"}}

    <Heading @title="Button set" />

    <Snippet @name="button-set.gts">
      {{! BEGIN-SNIPPET button-set }}
      <ButtonSet>
        <Button @label="Button 1" {{on "click" @controller.click}} />
        <Button @label="Button 2" {{on "click" @controller.click}} />
      </ButtonSet>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
