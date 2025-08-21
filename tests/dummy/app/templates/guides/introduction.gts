import { Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import { CodeBlock } from 'ember-shiki';

<template>
  {{pageTitle "Introduction"}}
  {{breadcrumb "Introduction" route="guides.introduction"}}

  <Heading @title="Introduction" />

  <p class="mb-4">First install the addon:</p>

  <p class="mb-4">
    <CodeBlock @code="ember install @trusted-american/design-system" />
  </p>

  <p class="mb-4">Then include Bootstrap's CSS in
    <code>ember-cli-build.js</code>:</p>

  <CodeBlock
    @language="js"
    @code="app.import('node_modules/bootstrap/dist/css/bootstrap.css');"
    class="mb-4"
  />

  <p class="mb-4">Finally, add the base components to
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
    <:default as |aside|>
      <aside.item @route="index" @label="Home" @icon=&lcub;&lcub;faHouse&rcub;&rcub; />
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
</template>
