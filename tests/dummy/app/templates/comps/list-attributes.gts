import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { array } from '@ember/helper';
import { hash, fn } from '@ember/helper';
import { Heading, ListAttributes } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsListAttributesController from '../../controllers/comps/list-attributes';

export default RouteTemplate<{
  Args: {
    controller: CompsListAttributesController;
  };
}>(
  <template>
    {{pageTitle "List attributes"}}
    {{breadcrumb "List attributes" route="comps.list-attributes"}}

    <Heading @title="List attributes" />

    <p>
      Value:
      {{#each @controller.selected as |item|}}
        {{item}}
      {{/each}}
    </p>

    <Snippet @name="list-attributes.gts">
      {{! BEGIN-SNIPPET list-attributes }}
      <ListAttributes
        @presets={{array (hash values=(array "a") label="Default")}}
        @options={{array
          (hash value="a" label="A")
          (hash value="b" label="B")
          (hash value="c" label="C")
        }}
        @selected={{@controller.selected}}
        @label="Edit columns"
        @onChange={{fn (mut @controller.selected)}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
