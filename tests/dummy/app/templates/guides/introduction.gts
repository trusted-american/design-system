import RouteTemplate from 'ember-route-template';
import { Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import { CodeBlock } from 'ember-shiki';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Introduction"}}
    {{breadcrumb "Introduction" route="guides.introduction"}}

    <Heading @title="Introduction" />

    <p>First install the addon:</p>

    <p>
      <CodeBlock @code="ember install @trusted-american/design-system" />
    </p>

    <p>Then include Bootstrap's CSS in <code>ember-cli-build.js</code>:</p>

    <p>
      <CodeBlock
        @language="js"
        @code="app.import('node_modules/bootstrap/dist/css/bootstrap.css');"
      />
    </p>

    <p>Finally, add the base components to
      <code>app/templates/application.gts</code>:</p>

    <CodeBlock
      @language="gts"
      @code='&lcub;&lcub;theme "light"&rcub;&rcub;

&lcub;&lcub;pageTitle "Title"&rcub;&rcub;
&lcub;&lcub;breadcrumb "Title" route="application"&rcub;&rcub;

<Frame>
  <Aside
    @title="Title"
    @logo="/logo.svg"
    @route="application"
    @isCollapsed=&lcub;&lcub;false&rcub;&rcub;
    @collapseLabel="Collapse menu"
    @onChange=&lcub;&lcub;(noop)&rcub;&rcub;
  >
    <:header>
      Header
    </:header>
    <:default>
      <AsideItem @route="index" @label="Home" @icon="house" />
    </:default>
    <:footer>
      Footer
    </:footer>
  </Aside>
  <Main>
    <MainTopHeader>
      Top header
    </MainTopHeader>
    <MainHeader>
      Header
    </MainHeader>
    <MainBody>
      Body
    </MainBody>
    <MainFooter>
      Footer
    </MainFooter>
  </Main>
</Frame>'
    />
  </template>,
) as TemplateFactory;
