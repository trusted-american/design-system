import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import {
  Button,
  dropdown,
  Dropdown,
  DropdownItem,
  Heading,
  Main,
  MainBody,
  MainFooter,
  MainHeader,
  MainTopHeader,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Main"}}
    {{breadcrumb "Main" route="components.main"}}

    <Heading @title="Main" />

    <Snippet @name="main.gts">
      {{! BEGIN-SNIPPET main }}
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
          <Dropdown>
            <DropdownItem @label="Action 1" />
            <DropdownItem @label="Action 2" />
            <DropdownItem @label="Action 3" />
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
  </template>,
) as TemplateFactory;
