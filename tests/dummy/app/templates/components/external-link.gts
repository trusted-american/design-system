import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { ExternalLink, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "External link"}}
    {{breadcrumb "External link" route="components.external-link"}}

    <Heading @title="External link" />

    <Snippet @name="external-link.gts">
      {{! BEGIN-SNIPPET external-link }}
      <ExternalLink
        @href="https://www.google.com/"
      >https://www.google.com</ExternalLink>
      ·
      <ExternalLink @href="https://www.google.com/">
        https://www.google.com/
      </ExternalLink>
      <hr />
      <ExternalLink
        @href="https://www.google.com/"
        @icon="up-right-from-square"
      >
        https://www.google.com/
      </ExternalLink>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
