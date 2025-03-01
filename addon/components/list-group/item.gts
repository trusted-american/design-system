import Link, { type LinkToArgs } from '../link';
import { or } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';

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
  {{#if (or @route @href)}}
    <Link
      @route={{@route}}
      @model={{@model}}
      @query={{@query}}
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
