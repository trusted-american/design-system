import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { noop } from '@nullvoxpopuli/ember-composable-helpers';
import {
  Aside,
  AsideGroup,
  AsideItem,
  AsideTitle,
  Heading,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "Aside"}}
    {{breadcrumb "Aside" route="components.aside"}}

    <Heading @title="Aside" />

    <Snippet @name="aside.gts">
      {{! BEGIN-SNIPPET aside }}
      <Aside
        @title="Title"
        @logo="/logo.svg"
        @route="index"
        @isCollapsed={{false}}
        @collapseLabel="Collapse menu"
        @onChange={{(noop)}}
      >
        <:default>
          <AsideItem @route="index" @label="Home" @icon="house" />
          <AsideItem
            @route="index"
            @label='With a "count"'
            @icon="users"
            @count={{12}}
          />
          <AsideItem
            @route="index"
            @label="Disabled"
            @icon="house"
            @isDisabled={{true}}
          />
        </:default>
        <:footerNav>Footer nav</:footerNav>
        <:footer>Footer</:footer>
      </Aside>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Aside group" />

    <Snippet @name="aside1.gts">
      {{! BEGIN-SNIPPET aside1 }}
      <AsideGroup @route="components.aside" @label="Label" @icon="box">
        <AsideItem @route="index" @label="Label" @icon="box" />
      </AsideGroup>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Aside item" />

    <Snippet @name="aside2.gts">
      {{! BEGIN-SNIPPET aside2 }}
      <AsideItem @route="index" @label="Label" @icon="box" />
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Aside title" />

    <Snippet @name="aside3.gts">
      {{! BEGIN-SNIPPET aside3 }}
      <AsideTitle @label="Label" />
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
