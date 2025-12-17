import {
  Button,
  Dropdown,
  Heading,
  Main,
  MainBody,
  MainFooter,
  MainHeader,
  MainTopHeader,
  Subheading,
  dropdown,
} from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

<template>
  {{pageTitle "Main"}}
  {{breadcrumb "Main" route="components.main"}}

  <Heading @title="Main" />

  <Snippet @name="main.gts">
    {{! BEGIN-SNIPPET main }}
    <Main as |main|>
      <main.topHeader>
        Top header
      </main.topHeader>
      <MainHeader>
        Header
      </MainHeader>
      <main.body>
        Body
      </main.body>
      <main.footer>
        Footer
      </main.footer>
    </Main>
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Main body" />

  <Snippet @name="main-body.gts">
    {{! BEGIN-SNIPPET main-body }}
    <MainBody>
      Body
    </MainBody>
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Main footer" />

  <Snippet @name="main-footer.gts">
    {{! BEGIN-SNIPPET main-footer }}
    <MainFooter>
      Footer
    </MainFooter>
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Main header" />

  <Snippet @name="main-header.gts">
    {{! BEGIN-SNIPPET main-header }}
    <MainHeader>
      <Heading @title="Title" @type="Type" @identifier="identifier">
        <Button @label="Actions" @color="primary" {{dropdown}} />
        <Dropdown as |dropdown|>
          <dropdown.item @label="Action 1" />
          <dropdown.item @label="Action 2" />
          <dropdown.item @label="Action 3" />
        </Dropdown>
      </Heading>
    </MainHeader>
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Main top header" />

  <Snippet @name="main-top-header.gts">
    {{! BEGIN-SNIPPET main-top-header }}
    <MainTopHeader>
      Top header
    </MainTopHeader>
    {{! END-SNIPPET }}
  </Snippet>
</template>
