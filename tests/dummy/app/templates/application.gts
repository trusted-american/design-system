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
  ExternalLink,
  FormCheck,
  FormInput,
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
        <AsideItem @label="Home" @route="index" @icon="house" />

        <AsideTitle @label="Assets" />
        <AsideGroup
          @label="Components"
          @icon="boxes-stacked"
          @route="components.index"
        >
          <AsideItem @label="Accordion" @route="components.accordion" />
          <AsideItem @label="Alert" @route="components.alert" />
          <AsideItem @label="Aside" @route="components.aside" />
          <AsideItem @label="Avatar" @route="components.avatar" />
          <AsideItem @label="Badge" @route="components.badge" />
          <AsideItem @label="Banner" @route="components.banner" />
          <AsideItem @label="Basic table" @route="components.basic-table" />
          <AsideItem
            @label="Breadcrumb trail"
            @route="components.breadcrumb-trail"
          />
          <AsideItem @label="Button" @route="components.button" />
          <AsideItem @label="Button group" @route="components.button-group" />
          <AsideItem @label="Button set" @route="components.button-set" />
          <AsideItem @label="Calendar" @route="components.calendar" />
          <AsideItem @label="Card" @route="components.card" />
          <AsideItem @label="Close button" @route="components.close-button" />
          <AsideItem @label="Collapse" @route="components.collapse" />
          <AsideItem @label="Copy button" @route="components.copy" />
          <AsideItem @label="Dropdown" @route="components.dropdown" />
          <AsideItem @label="External link" @route="components.external-link" />
          <AsideItem @label="File type" @route="components.file-type" />
          <AsideItem @label="Flyout" @route="components.flyout" />
          <AsideItem @label="Form" @route="components.form" />
          <AsideItem @label="Heading" @route="components.heading" />
          <AsideItem @label="Icon" @route="components.icon" />
          <AsideItem
            @label="List attributes"
            @route="components.list-attributes"
          />
          <AsideItem @label="List filter" @route="components.list-filter" />
          <AsideItem @label="List group" @route="components.list-group" />
          <AsideItem @label="List sort" @route="components.list-sort" />
          <AsideItem @label="Main" @route="components.main" />
          <AsideItem @label="Modal" @route="components.modal" />
          <AsideItem @label="Nav" @route="components.nav" />
          <AsideItem @label="Pagination" @route="components.pagination" />
          <AsideItem @label="Placeholder" @route="components.placeholder" />
          <AsideItem @label="Progress" @route="components.progress" />
          <AsideItem @label="Property list" @route="components.property-list" />
          <AsideItem @label="Ratio" @route="components.ratio" />
          <AsideItem @label="Skeleton" @route="components.skeleton" />
          <AsideItem @label="Spinner" @route="components.spinner" />
          <AsideItem @label="Stat card" @route="components.stat-card" />
          <AsideItem @label="Subheading" @route="components.subheading" />
          <AsideItem @label="Table" @route="components.table" />
          <AsideItem @label="Toast" @route="components.toast" />
        </AsideGroup>

        <AsideItem @label="Helpers" @icon="font" @route="helpers" />
        <AsideItem @label="Modifiers" @icon="code" @route="modifiers" />
        <AsideItem @label="Utils" @icon="screwdriver-wrench" @route="utils" />

        <AsideTitle @label="Guides" />
        <AsideItem
          @label="Introduction"
          @icon="book"
          @route="guides.introduction"
        />

        <AsideTitle @label="Examples" />
        <AsideItem @label="List" @icon="list" @route="list" />
        <AsideItem @label="Detail" @icon="box" @route="detail" />
        <AsideItem @label="Form" @icon="table-list" @route="form" />
        <AsideItem
          @label="Disabled"
          @icon="crop-simple"
          @route="detail"
          class="disabled"
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
        <ExternalLink @href="https://github.com/trusted-american/design-system">
          GitHub
        </ExternalLink>
      </MainFooter>
    </Main>
  </template>,
) as TemplateFactory;
