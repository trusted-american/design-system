import { LinkTo } from '@ember/routing';
import Link from '../link';
import { and } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';
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

const ListGroupItem: TOC<ListGroupItemSignature> = <template>
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
    <Link
      @href={{@href}}
      class="list-group-item list-group-item-action"
      ...attributes
    >
      {{yield}}
    </Link>
  {{else if @isAction}}
    <a href="#" class="list-group-item list-group-item-action" ...attributes>
      {{yield}}
    </a>
  {{else}}
    <li class="list-group-item" ...attributes>
      {{yield}}
    </li>
  {{/if}}
</template>;

export default ListGroupItem;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'ListGroup::Item': typeof ListGroupItem;
  }
}
