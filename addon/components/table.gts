import Component from '@glimmer/component';
import { action } from '@ember/object';
import Pagination from './pagination';
import YetiTable from 'ember-yeti-table/components/yeti-table';
import { dec } from '@nullvoxpopuli/ember-composable-helpers';
import { fn } from '@ember/helper';
import { and, eq, notEq, or } from 'ember-truth-helpers';

import type { ComponentLike } from '@glint/template';

export type YetiTableHeader = ComponentLike<{
  Blocks: {
    default: [
      {
        column: ComponentLike<{
          Args: {
            prop?: string;
            sortable?: boolean;
            sort?: 'asc' | 'desc' | null;
            visible?: unknown;
          };
          Blocks: {
            default: [];
          };
          Element: HTMLElement;
        }>;
      },
    ];
  };
  Element: HTMLElement;
}>;

export type YetiTableBody<T> = ComponentLike<{
  Blocks: {
    default: [
      {
        row: ComponentLike<{
          Args: {
            prop?: string;
          };
          Blocks: {
            default: [
              {
                cell: ComponentLike<{
                  Blocks: {
                    default: [];
                  };
                  Element: HTMLElement;
                }>;
              },
            ];
          };
          Element: HTMLElement;
        }>;
      },
      T,
    ];
  };
  Element: HTMLElement;
}>;

export type YetiTableFooter = ComponentLike<{
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}>;

export type YetiTableTfoot = ComponentLike<{
  Blocks: {
    default: [
      {
        row: ComponentLike<{
          Blocks: {
            default: [
              {
                cell: ComponentLike<{
                  Args: {
                    visible?: boolean;
                  };
                  Blocks: {
                    default: [];
                  };
                  Element: HTMLElement;
                }>;
              },
            ];
          };
          Element: HTMLElement;
        }>;
      },
    ];
  };
  Element: HTMLElement;
}>;

export interface PaginationData {
  isFirstPage: boolean;
  isLastPage: boolean;
  pageEnd: number;
  pageNumber: number;
  pageSize: number;
  pageStart: number;
  totalPages: undefined;
  totalRows: number;
}

export interface Actions {
  changePageSize: () => void;
  goToPage: (page: number) => void;
  nextPage: () => void;
  previousPage: () => void;
  reloadData: () => void;
}

export interface TableSignature<T> {
  Args: {
    data: T[];
    isSortable?: boolean;
    pagination?: 'local' | 'cursor' | 'offset';
    nextButtonLabel: string;
    previousButtonLabel: string;
    viewingLabel: string;
    ofLabel: string;
    resultsLabel: string;
    canNext?: boolean;
    canPrevious?: boolean;
    page?: number;
    totalItems?: number;
    onNext?: () => void;
    onPrevious?: () => void;
    onChangePage?: (page: number) => void;
  };
  Blocks: {
    default: [
      {
        header: YetiTableHeader;
        body: YetiTableBody<T>;
        footer: YetiTableFooter;
        tfoot: YetiTableTfoot;
        paginationData: PaginationData;
        actions: Actions;
      },
    ];
  };
  Element: HTMLDivElement;
}

export default class Table<T> extends Component<TableSignature<T>> {
  @action
  goToPage(actions: Actions, page: number): void {
    actions.goToPage(page + 1);
  }

  <template>
    <div class="table-responsive" ...attributes>
      <YetiTable
        @data={{@data}}
        @sortable={{@isSortable}}
        @pagination={{eq "local" @pagination}}
        @pageSize={{10}}
        class="table table-hover"
        data-test-table
        as |table|
      >
        {{yield table}}
        {{#if (eq "local" @pagination)}}
          <table.tfoot as |foot|>
            <foot.row as |row|>
              <row.cell colspan={{table.columns.length}}>
                {{#let (dec table.paginationData.pageNumber) as |page|}}
                  {{#if (notEq undefined page)}}
                    <Pagination
                      @page={{page}}
                      @pageSize={{10}}
                      @totalItems={{@data.length}}
                      @nextButtonLabel={{@nextButtonLabel}}
                      @previousButtonLabel={{@previousButtonLabel}}
                      @viewingLabel={{@viewingLabel}}
                      @ofLabel={{@ofLabel}}
                      @resultsLabel={{@resultsLabel}}
                      @onChange={{fn this.goToPage table.actions}}
                    />
                  {{/if}}
                {{/let}}
              </row.cell>
            </foot.row>
          </table.tfoot>
        {{/if}}
      </YetiTable>
    </div>

    {{#if (eq "cursor" @pagination)}}
      {{#if
        (and
          (notEq undefined @canNext)
          (notEq undefined @canPrevious)
          @onNext
          @onPrevious
        )
      }}
        <div class="d-flex justify-content-end mt-3 mb-0">
          <Pagination
            @canNext={{@canNext}}
            @canPrevious={{@canPrevious}}
            @nextButtonLabel={{@nextButtonLabel}}
            @previousButtonLabel={{@previousButtonLabel}}
            @viewingLabel={{@viewingLabel}}
            @ofLabel={{@ofLabel}}
            @resultsLabel={{@resultsLabel}}
            @onNext={{@onNext}}
            @onPrevious={{@onPrevious}}
          />
        </div>
      {{/if}}
    {{else if (eq "offset" @pagination)}}
      {{#if (and (or @page (eq 0 @page)) @totalItems @onChangePage)}}
        <Pagination
          @page={{@page}}
          @pageSize={{20}}
          @totalItems={{@totalItems}}
          @nextButtonLabel={{@nextButtonLabel}}
          @previousButtonLabel={{@previousButtonLabel}}
          @viewingLabel={{@viewingLabel}}
          @ofLabel={{@ofLabel}}
          @resultsLabel={{@resultsLabel}}
          @onChange={{@onChangePage}}
          class="mt-3"
        />
      {{/if}}
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Table: typeof Table;
  }
}
