import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import Component from '@glimmer/component';
import {
  ButtonSet,
  FormInput,
  Heading,
  MainBody,
  Table,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ListRoute from '../routes/list';

interface ListSignature {
  Args: {
    model: ModelFrom<ListRoute>;
  };
}

export default class List extends Component<ListSignature> {
  search = '';

  users = [
    { email: 'a@example.com', firstName: 'A', lastName: 'A' },
    { email: 'b@example.com', firstName: 'B', lastName: 'B' },
    { email: 'c@example.com', firstName: 'C', lastName: 'C' },
  ];

  click = () => {
    alert('Action');
  };

  <template>
    {{pageTitle "List"}}
    {{breadcrumb "List" route="list"}}

    <MainBody>
      <Heading @title="List">
        <ButtonSet as |buttonSet|>
          <FormInput
            @value={{this.search}}
            @type="search"
            @label="Search"
            @identifier="search"
            @requiredLabel="Required"
            @isInputOnly={{true}}
            @onChange={{fn (mut this.search)}}
            placeholder="Search…"
          />
          <buttonSet.button @label="Filter" {{on "click" this.click}} />
          <buttonSet.button @label="Sort" {{on "click" this.click}} />
          <buttonSet.button @label="Export" {{on "click" this.click}} />
          <buttonSet.button
            @label="Create"
            @color="primary"
            {{on "click" this.click}}
          />
        </ButtonSet>
      </Heading>

      <Table
        @data={{this.users}}
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
  </template>
}
