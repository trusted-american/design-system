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
    {{pageTitle "Design System"}}
    {{breadcrumb "Design System" route="application"}}

    {{theme @controller.theme}}

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
        <AsideGroup
          @label="Components"
          @icon="boxes-stacked"
          @route="comps.index"
        >
          <AsideItem @label="Accordion" @route="comps.accordion" />
          <AsideItem @label="Alert" @route="comps.alert" />
          <AsideItem @label="Aside" @route="comps.aside" />
          <AsideItem @label="Avatar" @route="comps.avatar" />
          <AsideItem @label="Badge" @route="comps.badge" />
          <AsideItem @label="Banner" @route="comps.banner" />
          <AsideItem @label="Basic table" @route="comps.basic-table" />
          <AsideItem
            @label="Breadcrumb trail"
            @route="comps.breadcrumb-trail"
          />
          <AsideItem @label="Button" @route="comps.button" />
          <AsideItem @label="Button group" @route="comps.button-group" />
          <AsideItem @label="Button set" @route="comps.button-set" />
          <AsideItem @label="Calendar" @route="comps.calendar" />
          <AsideItem @label="Card" @route="comps.card" />
          <AsideItem @label="Close button" @route="comps.close-button" />
          <AsideItem @label="Collapse" @route="comps.collapse" />
          <AsideItem @label="Copy button" @route="comps.copy" />
          <AsideItem @label="Dropdown" @route="comps.dropdown" />
          <AsideItem @label="External link" @route="comps.external-link" />
          <AsideItem @label="File type" @route="comps.file-type" />
          <AsideItem @label="Flyout" @route="comps.flyout" />
          <AsideItem @label="Form" @route="comps.form" />
          <AsideItem @label="Heading" @route="comps.heading" />
          <AsideItem @label="Icon" @route="comps.icon" />
          <AsideItem @label="List attributes" @route="comps.list-attributes" />
          <AsideItem @label="List filter" @route="comps.list-filter" />
          <AsideItem @label="List group" @route="comps.list-group" />
          <AsideItem @label="List sort" @route="comps.list-sort" />
          <AsideItem @label="Main" @route="comps.main" />
          <AsideItem @label="Modal" @route="comps.modal" />
          <AsideItem @label="Nav" @route="comps.nav" />
          <AsideItem @label="Pagination" @route="comps.pagination" />
          <AsideItem @label="Placeholder" @route="comps.placeholder" />
          <AsideItem @label="Progress" @route="comps.progress" />
          <AsideItem @label="Property list" @route="comps.property-list" />
          <AsideItem @label="Ratio" @route="comps.ratio" />
          <AsideItem @label="Skeleton" @route="comps.skeleton" />
          <AsideItem @label="Spinner" @route="comps.spinner" />
          <AsideItem @label="Stat card" @route="comps.stat-card" />
          <AsideItem @label="Subheading" @route="comps.subheading" />
          <AsideItem @label="Table" @route="comps.table" />
          <AsideItem @label="Toast" @route="comps.toast" />
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
