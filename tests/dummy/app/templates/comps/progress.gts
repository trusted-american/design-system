import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Heading, Progress } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Progress"}}
    {{breadcrumb "Progress" route="comps.progress"}}

    <Heading @title="Progress" />

    <Snippet @name="progress.gts">
      {{! BEGIN-SNIPPET progress }}
      <Progress as |progress|>
        <progress.bar @value={{0.3}} @color="danger" />
        <progress.bar @value={{0.3}} @color="warning" />
        <progress.bar @value={{0.3}} @color="success" />
      </Progress>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
