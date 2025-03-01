import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Heading, Placeholder } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsPlaceholderController from '../../controllers/comps/placeholder';

export default RouteTemplate<{
  Args: {
    controller: CompsPlaceholderController;
  };
}>(
  <template>
    {{pageTitle "Placeholder"}}
    {{breadcrumb "Placeholder" route="comps.placeholder"}}

    <Heading @title="Placeholder" />

    <Snippet @name="placeholder.hbs">
      {{! BEGIN-SNIPPET placeholder }}
      <Placeholder
        @icon="book"
        @title="Placeholder heading"
        @subtitle="Use it to provide information when no dynamic content exists."
        @buttonLabel="Create the first page"
        @secondaryButtonLabel="Learn more about wikis"
        @onClick={{@controller.click}}
        @onSecondaryClick={{@controller.click}}
      />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
