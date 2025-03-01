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

    <p>Finally, add the base components to <code>application.hbs</code>:</p>

    <CodeBlock
      @language="hbs"
      @code='&lcub;&lcub;page-title "Title"&rcub;&rcub;
&lcub;&lcub;breadcrumb "Title" route="application"&rcub;&rcub;
&lcub;&lcub;theme "light"&rcub;&rcub;

<Aside
  @title="Title"
  @logo="/logo.svg"
  @route="application"
  @isCollapsed=&lcub;&lcub;false&rcub;&rcub;
  @onChange=&lcub;&lcub;(noop)&rcub;&rcub;
>
  <:header>
    Header
  </:header>
  <:default>
    <Aside::Item @label="First" @route="index" @icon="house" />
    <Aside::Item @label="Second" @route="index" @icon="house" />
    <Aside::Item @label="Third" @route="index" @icon="house" />
  </:default>
  <:footer>
    Footer
  </:footer>
</Aside>
<Main>
  <Main::TopHeader>
    Top header
  </Main::TopHeader>
  <Main::Header>
    Header
  </Main::Header>
  <Main::Body>
    Body
  </Main::Body>
  <Main::Footer>
    Footer
  </Main::Footer>
</Main>'
    />
  </template>,
) as TemplateFactory;
