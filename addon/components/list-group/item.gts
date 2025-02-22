import Component from '@glimmer/component';
import { LinkTo } from '@ember/routing';
import ExternalLink from '../external-link';

import type { LinkToArgs } from '../button';

interface Args extends LinkToArgs {
  href?: string;
  isAction?: boolean;
}

export interface ListGroupItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement | HTMLLIElement;
}

export default class ListGroupItem extends Component<ListGroupItemSignature> {
  <template>
    {{#if (and @route @model)}}
      <LinkTo
        @route={{@route}}
        @model={{@model}}
        class="list-group-item list-group-item-action"
        ...attributes
      >
        {{yield}}
      </LinkTo>
    {{else if @route}}
      <LinkTo
        @route={{@route}}
        class="list-group-item list-group-item-action"
        ...attributes
      >
        {{yield}}
      </LinkTo>
    {{else if @query}}
      <LinkTo
        @query={{@query}}
        class="list-group-item list-group-item-action"
        ...attributes
      >
        {{yield}}
      </LinkTo>
    {{else if @href}}
      <ExternalLink
        @href={{@href}}
        class="list-group-item list-group-item-action"
        ...attributes
      >
        {{yield}}
      </ExternalLink>
    {{else if @isAction}}
      <a href="#" class="list-group-item list-group-item-action" ...attributes>
        {{yield}}
      </a>
    {{else}}
      <li class="list-group-item" ...attributes>
        {{yield}}
      </li>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'ListGroup::Item': typeof ListGroupItem;
  }
}
