import RouteTemplate from 'ember-route-template';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import {
  Button,
  ButtonSet,
  FormInput,
  Heading,
  MainBody,
  Table,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type ListController from '../controllers/list';

export default RouteTemplate<{
  Args: {
    controller: ListController;
  };
}>(
  <template>
    {{pageTitle "List"}}
    {{breadcrumb "List" route="list"}}

    <MainBody>
      <Heading @title="List">
        <ButtonSet>
          <FormInput
            @value={{@controller.search}}
            @type="search"
            @label="Search"
            @identifier="search"
            @requiredLabel="Required"
            @isInputOnly={{true}}
            @onChange={{fn (mut @controller.search)}}
            placeholder="Search…"
          />
          <Button @label="Filter" {{on "click" @controller.click}} />
          <Button @label="Sort" {{on "click" @controller.click}} />
          <Button @label="Export" {{on "click" @controller.click}} />
          <Button
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
  </template>,
) as TemplateFactory;
