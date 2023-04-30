import Component from '@glimmer/component';
import Button from './button';
import ButtonSet from './button-set';
import { on } from '@ember/modifier';
import YetiTable from 'ember-yeti-table/components/yeti-table/component';
// @ts-ignore
import eq from 'ember-truth-helpers/helpers/eq';
// @ts-ignore
import not from 'ember-truth-helpers/helpers/not';
import YetiTableHeader from 'ember-yeti-table/components/yeti-table/header';
import YetiTableBody from 'ember-yeti-table/components/yeti-table/body';
import YetiTableTFoot from 'ember-yeti-table/components/yeti-table/tfoot';
import YetiTablePagination from 'ember-yeti-table/components/yeti-table/pagination';

export interface TableSignature<T> {
  Element: HTMLTableElement;
  Args: {
    data: T[];
    sortable?: boolean;
    pagination?: 'local' | 'remote';
    canNext?: boolean;
    canPrevious?: boolean;
    onNext?: () => void;
    onPrevious?: () => void;
  };
  Blocks: {
    default: [
      {
        columns: [];
        header: typeof YetiTableHeader;
        body: typeof YetiTableBody<T>;
        tfoot: typeof YetiTableTFoot;
        pagination: typeof YetiTablePagination;
      }
    ];
  };
}

export default class Table<T> extends Component<TableSignature<T>> {
  <template>
    <div class='table-responsive'>
      <YetiTable
        @data={{@data}}
        @sortable={{@sortable}}
        @pagination={{eq 'local' @pagination}}
        class='table table-hover'
        ...attributes
        as |table|
      >
        {{yield table}}
        <table.tfoot as |foot|>
          <foot.row as |row|>
            <row.cell
              @visible={{if @pagination true false}}
              colspan={{table.columns.length}}
            >
              {{#if (eq 'local' @pagination)}}
                <table.pagination />
              {{else}}
                <ButtonSet>
                  {{#if @onPrevious}}
                    <Button
                      @text='Previous'
                      disabled={{not @canPrevious}}
                      {{on 'click' @onPrevious}}
                    />
                  {{/if}}
                  {{#if @onNext}}
                    <Button
                      @text='Next'
                      disabled={{not @canNext}}
                      {{on 'click' @onNext}}
                    />
                  {{/if}}
                </ButtonSet>
              {{/if}}
            </row.cell>
          </foot.row>
        </table.tfoot>
      </YetiTable>
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Table: typeof Table;
  }
}
