import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import type { User } from '../../routes/components/table';
import { Heading, Subheading, Table } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface ComponentsTableSignature {
  Args: {
    model: User[];
  };
}

export default class ComponentsTable extends Component<ComponentsTableSignature> {
  @tracked page = 0;

  get _page(): User[] {
    const pageSize = 20;
    const start = this.page * pageSize;
    const end = start + pageSize;
    return this.args.model.slice(start, end);
  }

  next = () => {
    alert('Next');
  };

  previous = () => {
    alert('Previous');
  };

  <template>
    {{pageTitle "Table"}}
    {{breadcrumb "Table" route="components.table"}}

    <Heading @title="Table" />

    <Subheading @title="Default" />

    <Snippet @name="table.gts">
      {{! BEGIN-SNIPPET table }}
      <Table
        @data={{@model}}
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
        <table.body as |body user|>
          <body.row as |row|>
            <row.cell>
              {{user.email}}
            </row.cell>
            <row.cell>
              {{user.firstName}}
            </row.cell>
            <row.cell>
              {{user.lastName}}
            </row.cell>
          </body.row>
        </table.body>
      </Table>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Sortable" />

    <Snippet @name="table1.gts">
      {{! BEGIN-SNIPPET table1 }}
      <Table
        @data={{@model}}
        @isSortable={{true}}
        @nextButtonLabel="Next"
        @previousButtonLabel="Previous"
        @viewingLabel="Viewing"
        @ofLabel="of"
        @resultsLabel="results"
        as |table|
      >
        <table.header as |header|>
          <header.column @prop="email" @sort="asc">
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
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Local pagination" />

    <Snippet @name="table2.gts">
      {{! BEGIN-SNIPPET table2 }}
      <Table
        @data={{@model}}
        @isSortable={{true}}
        @pagination="local"
        @nextButtonLabel="Next"
        @previousButtonLabel="Previous"
        @viewingLabel="Viewing"
        @ofLabel="of"
        @resultsLabel="results"
        as |table|
      >
        <table.header as |header|>
          <header.column @prop="email" @sort="asc">
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
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Cursor pagination" />

    <Snippet @name="table3.gts">
      {{! BEGIN-SNIPPET table3 }}
      <Table
        @data={{@model}}
        @isSortable={{true}}
        @pagination="cursor"
        @nextButtonLabel="Next"
        @previousButtonLabel="Previous"
        @viewingLabel="Viewing"
        @ofLabel="of"
        @resultsLabel="results"
        @canNext={{false}}
        @canPrevious={{false}}
        @onNext={{this.next}}
        @onPrevious={{this.previous}}
        as |table|
      >
        <table.header as |header|>
          <header.column @prop="email" @sort="asc">
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
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Offset pagination" />

    <Snippet @name="table4.gts">
      {{! BEGIN-SNIPPET table4 }}
      <Table
        @data={{this._page}}
        @isSortable={{true}}
        @pagination="offset"
        @nextButtonLabel="Next"
        @previousButtonLabel="Previous"
        @viewingLabel="Viewing"
        @ofLabel="of"
        @resultsLabel="results"
        @page={{this.page}}
        @totalItems={{@model.length}}
        @onChangePage={{fn (mut this.page)}}
        as |table|
      >
        <table.header as |header|>
          <header.column @prop="email" @sort="asc">
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
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
