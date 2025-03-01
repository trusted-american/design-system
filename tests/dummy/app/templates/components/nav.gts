import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import {
  Badge,
  Heading,
  Nav,
  NavItem,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Nav"}}
    {{breadcrumb "Nav" route="components.nav"}}

    <Heading @title="Nav" />

    <Subheading @title="Tabs" />

    <Snippet @name="nav.gts">
      {{! BEGIN-SNIPPET nav }}
      <Nav>
        <NavItem @route="components" @label="First" />
        <NavItem @route="index" @label="Second" @icon="house" />
        <NavItem @route="index" @label="Third" @count={{12}} />
        <NavItem @route="index" @label="Fourth">
          <Badge @label="New" />
        </NavItem>
      </Nav>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Pills" />

    <Snippet @name="nav2.gts">
      {{! BEGIN-SNIPPET nav2 }}
      <Nav @isPills={{true}}>
        <NavItem @route="components" @label="First" />
        <NavItem @route="index" @label="Second" @icon="house" />
        <NavItem @route="index" @label="Third" @count={{12}} />
        <NavItem @route="index" @label="Fourth">
          <Badge @label="New" />
        </NavItem>
      </Nav>
      <hr />
      <Nav @isPills={{true}} @isFill={{true}}>
        <NavItem @route="components" @label="First" />
        <NavItem @route="index" @label="Second" @icon="house" />
        <NavItem @route="index" @label="Third" @count={{12}} />
        <NavItem @route="index" @label="Fourth">
          <Badge @label="New" />
        </NavItem>
      </Nav>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Vertical" />

    <Snippet @name="nav3.gts">
      {{! BEGIN-SNIPPET nav3 }}
      <Nav @isPills={{true}} @isVertical={{true}}>
        <NavItem @route="components" @label="First" />
        <NavItem @route="index" @label="Second" @icon="house" />
        <NavItem @route="index" @label="Third" @count={{12}} />
        <NavItem @route="index" @label="Fourth">
          <Badge @label="New" />
        </NavItem>
      </Nav>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
