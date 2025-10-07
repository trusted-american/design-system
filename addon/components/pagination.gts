import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import Component from '@glimmer/component';
import { and, eq, gt, lt } from 'ember-truth-helpers';
import PaginationItem from './pagination/item';

const Ellipsis = <template>
  <li class="page-item">
    <div class="page-link" disabled>
      …
    </div>
  </li>
</template>;

interface Args {
  nextButtonLabel: string;
  previousButtonLabel: string;
  viewingLabel: string;
  ofLabel: string;
  resultsLabel: string;
}

interface OffsetArgs extends Args {
  page: number;
  pageSize: number;
  totalItems: number;
  onChange: (page: number) => void;
}

interface CursorArgs extends Args {
  page?: never;
  canNext: boolean;
  canPrevious: boolean;
  onNext: () => void;
  onPrevious: () => void;
  onChange?: never;
}

export interface PaginationSignature {
  Args: OffsetArgs | CursorArgs;
  Element: HTMLDivElement;
}

export default class Pagination extends Component<PaginationSignature> {
  get twoAway(): number {
    return this.pages.length - 2; // used For the trailing ... logic
  }

  get length(): number {
    return this.pages.length - 1;
  }

  get beforeCurrentIndex(): number {
    if (!this.args.page) {
      return -1;
    }
    return this.args.page - 1;
  }

  get afterCurrentIndex(): number {
    if (!this.args.page) {
      return -1;
    }
    return this.args.page + 1;
  }

  get pages(): number[] {
    if (!('pageSize' in this.args)) {
      return [];
    }
    const num = Math.ceil(this.args.totalItems / this.args.pageSize);
    return new Array(num) as number[];
  }

  get canNext(): boolean {
    if ('canNext' in this.args) {
      return this.args.canNext;
    }
    return this.args.page < this.pages.length - 1;
  }

  get canPrevious(): boolean {
    if ('canPrevious' in this.args) {
      return this.args.canPrevious;
    }
    return this.args.page > 0;
  }

  get pageStart(): number {
    if (!('pageSize' in this.args)) {
      return 0;
    }
    return 1 + this.args.page * this.args.pageSize;
  }

  get pageEnd(): number {
    if (!('pageSize' in this.args)) {
      return 0;
    }
    return Math.min(
      this.pageStart + this.args.pageSize - 1,
      this.args.totalItems,
    );
  }

  next = (event: Event) => {
    event.preventDefault();

    if ('pageSize' in this.args) {
      this.args.onChange(this.args.page + 1);
    } else {
      this.args.onNext();
    }
  };

  previous = (event: Event) => {
    event.preventDefault();

    if ('pageSize' in this.args) {
      this.args.onChange(this.args.page - 1);
    } else {
      this.args.onPrevious();
    }
  };

  change = (index: number, event: Event) => {
    event.preventDefault();

    if ('onChange' in this.args) {
      this.args.onChange?.(index);
    }
  };

  <template>
    <div
      class="d-flex justify-content-between align-items-center gap-2"
      ...attributes
    >
      {{#if @onChange}}
        <span>
          {{@viewingLabel}}
          <strong>{{this.pageStart}}-{{this.pageEnd}}</strong>
          {{@ofLabel}}
          <strong>{{@totalItems}}</strong>
          {{@resultsLabel}}
        </span>
      {{/if}}
      <nav data-test-pagination>
        <ul class="pagination mb-0">
          <li class="page-item {{unless this.canPrevious 'disabled'}}">
            <a
              class="page-link"
              href="#"
              data-test-previous
              {{on "click" this.previous}}
            >{{@previousButtonLabel}}</a>
          </li>
          {{#if (lt this.length 6)}}
            {{#each this.pages as |_ index|}}
              <PaginationItem
                @page={{@page}}
                @index={{index}}
                @onClick={{fn this.change index}}
              />
            {{/each}}
          {{else}}
            {{#each this.pages as |_ index|}}
              {{#if (eq index 0)}}
                <PaginationItem
                  @page={{@page}}
                  @index={{index}}
                  @onClick={{fn this.change index}}
                />
                {{#if (eq @page index)}}
                  <PaginationItem
                    @page={{@page}}
                    @index={{1}}
                    @onClick={{fn this.change 1}}
                  />
                  <Ellipsis />
                  <PaginationItem
                    @page={{@page}}
                    @index={{this.twoAway}}
                    @onClick={{fn this.change this.twoAway}}
                  />
                {{/if}}
              {{else if
                (and
                  (and (eq index this.beforeCurrentIndex) (gt index 0))
                  (lt index this.twoAway)
                )
              }}
                {{#if (gt index 1)}}
                  <Ellipsis />
                {{/if}}
                <PaginationItem
                  @page={{@page}}
                  @index={{index}}
                  @onClick={{fn this.change index}}
                />
              {{else if (eq index @page)}}
                {{#if (eq index this.length)}}
                  <PaginationItem
                    @page={{@page}}
                    @index={{1}}
                    @onClick={{fn this.change 1}}
                  />
                  <Ellipsis />
                  <PaginationItem
                    @page={{@page}}
                    @index={{this.twoAway}}
                    @onClick={{fn this.change this.twoAway}}
                  />
                {{/if}}
                <PaginationItem
                  @page={{@page}}
                  @index={{index}}
                  @onClick={{fn this.change index}}
                />
              {{else if
                (and (eq index this.afterCurrentIndex) (lt index this.length))
              }}
                <PaginationItem
                  @page={{@page}}
                  @index={{index}}
                  @onClick={{fn this.change index}}
                />
                {{#if (lt index this.twoAway)}}
                  <Ellipsis />
                {{/if}}
              {{else if (eq index this.length)}}
                <PaginationItem
                  @page={{@page}}
                  @index={{index}}
                  @onClick={{fn this.change index}}
                />
              {{/if}}
            {{/each}}
          {{/if}}
          <li class="page-item {{unless this.canNext 'disabled'}}">
            <a
              class="page-link"
              href="#"
              data-test-next
              {{on "click" this.next}}
            >{{@nextButtonLabel}}</a>
          </li>
        </ul>
      </nav>
    </div>
  </template>
}
