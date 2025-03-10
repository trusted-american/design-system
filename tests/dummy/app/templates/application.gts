import RouteTemplate from 'ember-route-template';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import {
  Aside,
  AsideGroup,
  AsideTitle,
  BreadcrumbTrail,
  Button,
  FormCheck,
  FormInput,
  Frame,
  Link,
  Main,
  MainFooter,
  MainTopHeader,
  theme,
  tooltip,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type ApplicationController from '../controllers/application';

export default RouteTemplate<{
  Args: {
    controller: ApplicationController;
  };
}>(
  <template>
    {{theme @controller.theme}}

    {{pageTitle "Design System"}}
    {{breadcrumb "Design System" route="application"}}

    <Frame>
      <Aside
        @title="Design System"
        @logo="/logo.svg"
        @route="application"
        @isCollapsed={{@controller.isCollapsed}}
        @collapseLabel="Collapse menu"
        @onChange={{fn (mut @controller.isCollapsed)}}
      >
        <:default as |aside|>
          <aside.item @route="index" @label="Home" @icon="house" />

          <AsideTitle @label="Assets" />
          <AsideGroup
            @route="components.index"
            @label="Components"
            @icon="boxes-stacked"
          >
            <aside.item @route="components.accordion" @label="Accordion" />
            <aside.item @route="components.alert" @label="Alert" />
            <aside.item @route="components.aside" @label="Aside" />
            <aside.item @route="components.avatar" @label="Avatar" />
            <aside.item @route="components.badge" @label="Badge" />
            <aside.item @route="components.banner" @label="Banner" />
            <aside.item @route="components.basic-table" @label="Basic table" />
            <aside.item
              @route="components.breadcrumb-trail"
              @label="Breadcrumb trail"
            />
            <aside.item @route="components.button" @label="Button" />
            <aside.item
              @route="components.button-group"
              @label="Button group"
            />
            <aside.item @route="components.button-set" @label="Button set" />
            <aside.item @route="components.calendar" @label="Calendar" />
            <aside.item @route="components.card" @label="Card" />
            <aside.item
              @route="components.close-button"
              @label="Close button"
            />
            <aside.item @route="components.collapse" @label="Collapse" />
            <aside.item @route="components.copy" @label="Copy button" />
            <aside.item @route="components.dropdown" @label="Dropdown" />
            <aside.item @route="components.file-type" @label="File type" />
            <aside.item @route="components.flyout" @label="Flyout" />
            <aside.item @route="components.form" @label="Form" />
            <aside.item @route="components.heading" @label="Heading" />
            <aside.item @route="components.icon" @label="Icon" />
            <aside.item @route="components.link" @label="Link" />
            <aside.item
              @route="components.list-attributes"
              @label="List attributes"
            />
            <aside.item @route="components.list-filter" @label="List filter" />
            <aside.item @route="components.list-group" @label="List group" />
            <aside.item @route="components.list-sort" @label="List sort" />
            <aside.item @route="components.main" @label="Main" />
            <aside.item @route="components.modal" @label="Modal" />
            <aside.item @route="components.nav" @label="Nav" />
            <aside.item @route="components.pagination" @label="Pagination" />
            <aside.item @route="components.placeholder" @label="Placeholder" />
            <aside.item @route="components.progress" @label="Progress" />
            <aside.item
              @route="components.property-list"
              @label="Property list"
            />
            <aside.item @route="components.ratio" @label="Ratio" />
            <aside.item @route="components.skeleton" @label="Skeleton" />
            <aside.item @route="components.spinner" @label="Spinner" />
            <aside.item @route="components.stat-card" @label="Stat card" />
            <aside.item @route="components.subheading" @label="Subheading" />
            <aside.item @route="components.table" @label="Table" />
            <aside.item @route="components.toast" @label="Toast" />
          </AsideGroup>

          <aside.item @route="helpers" @icon="font" @label="Helpers" />
          <aside.item @route="modifiers" @icon="code" @label="Modifiers" />
          <aside.item
            @route="utils"
            @icon="screwdriver-wrench"
            @label="Utils"
          />

          <AsideTitle @label="Guides" />
          <aside.item
            @route="guides.introduction"
            @label="Introduction"
            @icon="book"
          />

          <AsideTitle @label="Examples" />
          <aside.item @route="list" @label="List" @icon="list" />
          <aside.item @route="detail" @label="Detail" @icon="box" />
          <aside.item @route="form" @label="Form" @icon="table-list" />
          <aside.item
            @route="detail"
            @label="Disabled"
            @icon="crop-simple"
            @isDisabled={{true}}
          />
        </:default>
        <:footer>
          <FormCheck
            @value={{@controller.isDarkTheme}}
            @label="Dark theme"
            @identifier="isDarkTheme"
            @requiredLabel="Required"
            @isSwitch={{true}}
            @onChange={{fn (mut @controller.isDarkTheme)}}
          />
        </:footer>
      </Aside>
      <Main>
        <MainTopHeader>
          <div class="d-flex align-items-center gap-3">
            {{#if @controller.isCollapsed}}
              <Button
                @label="Expand menu"
                @icon="angles-right"
                @color="none"
                @isIconOnly={{true}}
                {{tooltip "Expand menu" trigger="hover"}}
                {{on "click" @controller.expand}}
              />
            {{/if}}
            <FormInput
              @value={{@controller.query}}
              @type="search"
              @label="Search"
              @identifier="search"
              @requiredLabel="Required"
              @isInputOnly={{true}}
              @onChange={{fn (mut @controller.query)}}
              placeholder="Search"
            />
          </div>
        </MainTopHeader>
        <MainTopHeader>
          <BreadcrumbTrail />
        </MainTopHeader>

        {{outlet}}

        <MainFooter>
          <Link @href="https://github.com/trusted-american/design-system">
            GitHub
          </Link>
        </MainFooter>
      </Main>
    </Frame>
  </template>,
);
