import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import {
  faAnglesRight,
  faBook,
  faBox,
  faBoxesStacked,
  faCode,
  faCropSimple,
  faFont,
  faHouse,
  faList,
  faScrewdriverWrench,
  faTableList,
} from '@fortawesome/free-solid-svg-icons';
import {
  Aside,
  BreadcrumbTrail,
  Button,
  FormCheck,
  FormInput,
  Frame,
  Link,
  Main,
  theme,
  tooltip,
} from '@trusted-american/ember';
import type { Theme } from '@trusted-american/ember/helpers/theme';
import BasicDropdownWormhole from 'ember-basic-dropdown/components/basic-dropdown-wormhole';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

interface ApplicationSignature {
  Args: {
    model: unknown;
  };
}

export default class Application extends Component<ApplicationSignature> {
  @tracked theme: Theme = 'light';

  @tracked isCollapsed = false;
  @tracked query = '';

  expand = () => {
    this.isCollapsed = false;
  };

  get isDarkTheme(): boolean {
    return this.theme === 'dark';
  }
  set isDarkTheme(value: boolean) {
    this.theme = value ? 'dark' : 'light';
  }

  <template>
    {{theme this.theme}}

    {{pageTitle "Design System"}}
    {{breadcrumb "Design System" route="application"}}

    <Frame>
      <Aside
        @title="Design System"
        @logo="/logo.svg"
        @route="application"
        @isCollapsed={{this.isCollapsed}}
        @collapseLabel="Collapse menu"
        @onChange={{fn (mut this.isCollapsed)}}
      >
        <:default as |aside|>
          <aside.item @route="index" @label="Home" @icon={{faHouse}} />

          <aside.title @label="Assets" />
          <aside.group
            @route="components.index"
            @label="Components"
            @icon={{faBoxesStacked}}
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
            <aside.item @route="components.frame" @label="Frame" />
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
          </aside.group>

          <aside.item @route="helpers" @icon={{faFont}} @label="Helpers" />
          <aside.item @route="modifiers" @icon={{faCode}} @label="Modifiers" />
          <aside.item
            @route="utils"
            @icon={{faScrewdriverWrench}}
            @label="Utils"
          />

          <aside.title @label="Guides" />
          <aside.item
            @route="guides.introduction"
            @label="Introduction"
            @icon={{faBook}}
          />

          <aside.title @label="Examples" />
          <aside.item @route="list" @label="List" @icon={{faList}} />
          <aside.item @route="detail" @label="Detail" @icon={{faBox}} />
          <aside.item @route="form" @label="Form" @icon={{faTableList}} />
          <aside.item
            @route="detail"
            @label="Disabled"
            @icon={{faCropSimple}}
            @isDisabled={{true}}
          />
        </:default>
        <:footer>
          <FormCheck
            @value={{this.isDarkTheme}}
            @label="Dark theme"
            @id="isDarkTheme"
            @requiredLabel="Required"
            @isSwitch={{true}}
            @onChange={{fn (mut this.isDarkTheme)}}
          />
        </:footer>
      </Aside>
      <Main as |main|>
        <main.topHeader>
          <div class="d-flex align-items-center gap-3">
            {{#if this.isCollapsed}}
              <Button
                @label="Expand menu"
                @icon={{faAnglesRight}}
                @isIconOnly={{true}}
                {{tooltip "Expand menu" trigger="hover"}}
                {{on "click" this.expand}}
              />
            {{/if}}
            <FormInput
              @value={{this.query}}
              @type="search"
              @label="Search"
              @id="search"
              @requiredLabel="Required"
              @isInputOnly={{true}}
              @onChange={{fn (mut this.query)}}
              placeholder="Search"
            />
          </div>
        </main.topHeader>
        <main.topHeader>
          <BreadcrumbTrail />
        </main.topHeader>

        {{outlet}}

        <main.footer>
          <Link @href="https://github.com/trusted-american/design-system">
            GitHub
          </Link>
        </main.footer>
      </Main>
    </Frame>

    <BasicDropdownWormhole />
  </template>
}
