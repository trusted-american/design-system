import { array, fn, hash } from '@ember/helper';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { on } from '@ember/modifier';
import type { DateRangeQueryParam } from '@trusted-american/design-system/components/list-filter';
import {
  Button,
  Heading,
  ListFilter,
  timestamp,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface ComponentsListFilterSignature {
  Args: {};
}

export default class ComponentsListFilter extends Component<ComponentsListFilterSignature> {
  @tracked status?: 'active' | 'inactive';
  @tracked type: ('primary' | 'secondary')[] = [];
  @tracked tag?: string;
  @tracked createdAt: DateRangeQueryParam = [];
  @tracked other: 'active' | 'inactive' = 'active';

  get gte(): Date | null {
    if (Array.isArray(this.createdAt)) {
      return null;
    }
    return this.createdAt.gte;
  }

  get gt(): Date | null {
    if (Array.isArray(this.createdAt)) {
      return null;
    }
    return this.createdAt.gt;
  }

  get lt(): Date | null {
    if (Array.isArray(this.createdAt)) {
      return null;
    }
    return this.createdAt.lt;
  }

  get lte(): Date | null {
    if (Array.isArray(this.createdAt)) {
      return null;
    }
    return this.createdAt.lte;
  }

  change = (key: string, value: unknown) => {
    this[key as keyof this] = value as this[keyof this];
  };
}

<template>
  {{pageTitle "List filter"}}
  {{breadcrumb "List filter" route="components.list-filter"}}

  <Heading @title="List filter" />

  <Button
    @label="Update"
    class="mb-3"
    {{on "click" (fn (mut this.status) "inactive")}}
  />

  <ul>
    <li>Status: {{this.status}}</li>
    <li>Type:
      {{#each this.type as |t|}}
        {{t}}
      {{/each}}
    </li>
    <li>Tag: {{this.tag}}</li>
    <li>Created date:
      {{#if this.createdAt}}
        <ul>
          <li>
            gte:
            {{timestamp this.gte}}
          </li>
          <li>
            gt:
            {{timestamp this.gt}}
          </li>
          <li>
            lt:
            {{timestamp this.lt}}
          </li>
          <li>
            lte:
            {{timestamp this.lte}}
          </li>
        </ul>
      {{/if}}
    </li>
    <li>Other: {{this.other}}</li>
  </ul>

  <Snippet @name="list-filter.gts">
    {{! BEGIN-SNIPPET list-filter }}
    <ListFilter
      @predicates={{array
        (hash
          label="Status"
          key="status"
          value=this.status
          options=(array
            (hash value="active" label="Active")
            (hash value="inactive" label="Inactive")
          )
        )
        (hash
          type="multi"
          label="Type"
          key="type"
          value=this.type
          options=(array
            (hash value="primary" label="Primary")
            (hash value="secondary" label="Secondary")
          )
        )
        (hash type="string" label="Tag" key="tag" value=this.tag)
        (hash
          type="date"
          label="Created date"
          key="createdAt"
          value=this.createdAt
        )
        (hash
          label="Other"
          key="other"
          value=this.other
          options=(array
            (hash value="active" label="Active")
            (hash value="inactive" label="Inactive")
          )
        )
      }}
      @label="Filter"
      @clearLabel="Clear"
      @doneLabel="Done"
      @modeLabel="Mode"
      @inTheLastLabel="is in the last"
      @equalsLabel="is equal to"
      @betweenLabel="is between"
      @isAfterLabel="is after"
      @isAfterOrOnLabel="is on or after"
      @isBeforeLabel="is before"
      @isBeforeOrOnLabel="is before or on"
      @valueLabel="Value"
      @valueALabel="Value A"
      @valueBLabel="Value B"
      @andLabel="and"
      @daysLabel="Days"
      @monthsLabel="Months"
      @requiredLabel="Required"
      @chooseLabel="Choose…"
      @searchLabel="Search…"
      @onChange={{this.change}}
    />
    {{! END-SNIPPET }}
  </Snippet>
  </template>
}
