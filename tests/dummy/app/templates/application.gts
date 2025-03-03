import RouteTemplate from 'ember-route-template';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import {
  Aside,
  AsideGroup,
  AsideItem,
  AsideTitle,
  BreadcrumbTrail,
  Button,
  FormCheck,
  FormInput,
  Link,
  Main,
  MainFooter,
  MainTopHeader,
  theme,
  tooltip,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
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

    <Aside
      @title="Design System"
      @logo="/logo.svg"
      @route="application"
      @isCollapsed={{@controller.isCollapsed}}
      @collapseLabel="Collapse menu"
      @onChange={{fn (mut @controller.isCollapsed)}}
    >
      <:default>
        <AsideItem @route="index" @label="Home" @icon="house" />

        <AsideTitle @label="Assets" />
        <AsideGroup
          @route="components.index"
          @label="Components"
          @icon="boxes-stacked"
        >
          <AsideItem @route="components.accordion" @label="Accordion" />
          <AsideItem @route="components.alert" @label="Alert" />
          <AsideItem @route="components.aside" @label="Aside" />
          <AsideItem @route="components.avatar" @label="Avatar" />
          <AsideItem @route="components.badge" @label="Badge" />
          <AsideItem @route="components.banner" @label="Banner" />
          <AsideItem @route="components.basic-table" @label="Basic table" />
          <AsideItem
            @route="components.breadcrumb-trail"
            @label="Breadcrumb trail"
          />
          <AsideItem @route="components.button" @label="Button" />
          <AsideItem @route="components.button-group" @label="Button group" />
          <AsideItem @route="components.button-set" @label="Button set" />
          <AsideItem @route="components.calendar" @label="Calendar" />
          <AsideItem @route="components.card" @label="Card" />
          <AsideItem @route="components.close-button" @label="Close button" />
          <AsideItem @route="components.collapse" @label="Collapse" />
          <AsideItem @route="components.copy" @label="Copy button" />
          <AsideItem @route="components.dropdown" @label="Dropdown" />
          <AsideItem @route="components.file-type" @label="File type" />
          <AsideItem @route="components.flyout" @label="Flyout" />
          <AsideItem @route="components.form" @label="Form" />
          <AsideItem @route="components.heading" @label="Heading" />
          <AsideItem @route="components.icon" @label="Icon" />
          <AsideItem @route="components.link" @label="Link" />
          <AsideItem
            @route="components.list-attributes"
            @label="List attributes"
          />
          <AsideItem @route="components.list-filter" @label="List filter" />
          <AsideItem @route="components.list-group" @label="List group" />
          <AsideItem @route="components.list-sort" @label="List sort" />
          <AsideItem @route="components.main" @label="Main" />
          <AsideItem @route="components.modal" @label="Modal" />
          <AsideItem @route="components.nav" @label="Nav" />
          <AsideItem @route="components.pagination" @label="Pagination" />
          <AsideItem @route="components.placeholder" @label="Placeholder" />
          <AsideItem @route="components.progress" @label="Progress" />
          <AsideItem @route="components.property-list" @label="Property list" />
          <AsideItem @route="components.ratio" @label="Ratio" />
          <AsideItem @route="components.skeleton" @label="Skeleton" />
          <AsideItem @route="components.spinner" @label="Spinner" />
          <AsideItem @route="components.stat-card" @label="Stat card" />
          <AsideItem @route="components.subheading" @label="Subheading" />
          <AsideItem @route="components.table" @label="Table" />
          <AsideItem @route="components.toast" @label="Toast" />
        </AsideGroup>

        <AsideItem @route="helpers" @icon="font" @label="Helpers" />
        <AsideItem @route="modifiers" @icon="code" @label="Modifiers" />
        <AsideItem @route="utils" @icon="screwdriver-wrench" @label="Utils" />

        <AsideTitle @label="Guides" />
        <AsideItem
          @route="guides.introduction"
          @label="Introduction"
          @icon="book"
        />

        <AsideTitle @label="Examples" />
        <AsideItem @route="list" @label="List" @icon="list" />
        <AsideItem @route="detail" @label="Detail" @icon="box" />
        <AsideItem @route="form" @label="Form" @icon="table-list" />
        <AsideItem
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
  </template>,
) as TemplateFactory;
