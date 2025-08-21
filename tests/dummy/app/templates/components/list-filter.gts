import type { TOC } from '@ember/component/template-only';
import { array, fn, hash } from '@ember/helper';
import { on } from '@ember/modifier';
import {
  Button,
  Heading,
  ListFilter,
  timestamp,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';
import type ComponentsListFilterController from '../../controllers/components/list-filter';

interface ComponentsListFilterSignature {
  Args: {
    controller: ComponentsListFilterController;
  };
}

<template>
  {{pageTitle "List filter"}}
  {{breadcrumb "List filter" route="components.list-filter"}}

  <Heading @title="List filter" />

  <Button
    @label="Update"
    class="mb-4"
    {{on "click" (fn (mut @controller.status) "inactive")}}
  />

  <ul class="mb-4">
    <li>Status: {{@controller.status}}</li>
    <li>Type:
      {{#each @controller.type as |t|}}
        {{t}}
      {{/each}}
    </li>
    <li>Tag: {{@controller.tag}}</li>
    <li>Created date:
      {{#if @controller.createdAt}}
        <ul>
          <li>
            gte:
            {{timestamp @controller.gte}}
          </li>
          <li>
            gt:
            {{timestamp @controller.gt}}
          </li>
          <li>
            lt:
            {{timestamp @controller.lt}}
          </li>
          <li>
            lte:
            {{timestamp @controller.lte}}
          </li>
        </ul>
      {{/if}}
    </li>
    <li>Other: {{@controller.other}}</li>
  </ul>

  <Snippet @name="list-filter.gts">
    {{! BEGIN-SNIPPET list-filter }}
    <ListFilter
      @predicates={{array
        (hash
          label="Status"
          key="status"
          value=@controller.status
          options=(array
            (hash value="active" label="Active")
            (hash value="inactive" label="Inactive")
          )
        )
        (hash
          type="multi"
          label="Type"
          key="type"
          value=@controller.type
          options=(array
            (hash value="primary" label="Primary")
            (hash value="secondary" label="Secondary")
          )
        )
        (hash type="string" label="Tag" key="tag" value=@controller.tag)
        (hash
          type="date"
          label="Created date"
          key="createdAt"
          value=@controller.createdAt
        )
        (hash
          label="Other"
          key="other"
          value=@controller.other
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
      {{! TODO: ellipsis }}
      @chooseLabel="Choose..."
      @searchLabel="Search..."
      @onChange={{@controller.change}}
    />
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsListFilterSignature>;
