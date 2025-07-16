import Snippet from '../../components/snippet';
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
import { faBox, faHouse, faUsers } from '@fortawesome/free-solid-svg-icons';

const change = () => {
  //
};

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
      @onChange={{change}}
    >
      <:default as |aside|>
        <aside.item @route="index" @label="Home" @icon={{faHouse}} />
        <aside.item
          @route="index"
          @label='With a "count"'
          @icon={{faUsers}}
          @count={{12}}
        />
        <aside.item
          @route="index"
          @label="Disabled"
          @icon={{faHouse}}
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
    <AsideGroup @route="components.aside" @label="Label" @icon={{faBox}}>
      <AsideItem @route="index" @label="Label" @icon={{faBox}} />
    </AsideGroup>
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Aside item" />

  <Snippet @name="aside2.gts">
    {{! BEGIN-SNIPPET aside2 }}
    <AsideItem @route="index" @label="Label" @icon={{faBox}} />
    {{! END-SNIPPET }}
  </Snippet>

  <Subheading @title="Aside title" />

  <Snippet @name="aside3.gts">
    {{! BEGIN-SNIPPET aside3 }}
    <AsideTitle @label="Label" />
    {{! END-SNIPPET }}
  </Snippet>
</template>
