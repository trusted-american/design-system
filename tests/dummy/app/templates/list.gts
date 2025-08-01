import type { TOC } from '@ember/component/template-only';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import {
  ButtonSet,
  FormInput,
  Heading,
  MainBody,
  Table,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ListController from '../controllers/list';

interface ListSignature {
  Args: {
    controller: ListController;
  };
}

<template>
  {{pageTitle "List"}}
  {{breadcrumb "List" route="list"}}

  <MainBody>
    <Heading @title="List">
      <ButtonSet as |buttonSet|>
        <FormInput
          @value={{@controller.search}}
          @type="search"
          @label="Search"
          @identifier="search"
          @requiredLabel="Required"
          @isInputOnly={{true}}
          @onChange={{fn (mut @controller.search)}}
          {{! TODO: ellipsis }}
          placeholder="Search..."
        />
        <buttonSet.button @label="Filter" {{on "click" @controller.click}} />
        <buttonSet.button @label="Sort" {{on "click" @controller.click}} />
        <buttonSet.button @label="Export" {{on "click" @controller.click}} />
        <buttonSet.button
          @label="Create"
          @color="primary"
          {{on "click" @controller.click}}
        />
      </ButtonSet>
    </Heading>

    <Table
      @data={{@controller.users}}
      @nextButtonLabel="Next"
      @previousButtonLabel="Previous"
      @viewingLabel="Viewing"
      @ofLabel="of"
      @resultsLabel="results"
      as |table|
    >
      <table.header as |header|>
        <header.column @prop="email">
          Email
        </header.column>
        <header.column @prop="firstName">
          First Name
        </header.column>
        <header.column @prop="lastName">
          Last Name
        </header.column>
      </table.header>
      <table.body />
    </Table>
  </MainBody>
</template> satisfies TOC<ListSignature>;
