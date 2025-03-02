import Badge from '../badge';
import Icon from '../icon';
import Link from '../link';

import type { TOC } from '@ember/component/template-only';
import type { IconName } from '@fortawesome/fontawesome-svg-core';
import type { LinkToArgs } from '../link';

const Internal: TOC<{
  Args: {
    label?: string;
    icon?: IconName;
    count?: number;
    trailingIcon?: IconName;
  };
  Blocks: {
    default: [];
  };
}> = <template>
  {{#if @icon}}
    <Icon @icon={{@icon}} @isFixedWidth={{true}} class="me-1" />
  {{/if}}
  {{#if @label}}{{@label}}{{/if}}
  {{yield}}
  <div class="d-inline float-end">
    {{#if @count}}
      <Badge @label="{{@count}}" @isPill={{true}} class="ms-2" />
    {{/if}}
    {{#if @trailingIcon}}
      <Icon @icon={{@trailingIcon}} @isFixedWidth={{true}} class="ms-2" />
    {{/if}}
  </div>
</template>;

interface Args extends LinkToArgs {
  label?: string;
  icon?: IconName;
  count?: number;
  trailingIcon?: IconName;
  isDisabled?: boolean;
}

export interface NavItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

const NavItem: TOC<NavItemSignature> = <template>
  {{#if (or @route @model @query)}}
    <Link
      @route={{@route}}
      @model={{@model}}
      @query={{@query}}
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <Internal
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </Internal>
    </Link>
  {{else}}
    <a
      href="#"
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <Internal
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </Internal>
    </a>
  {{/if}}
</template>;

export default NavItem;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Nav::Item': typeof NavItem;
  }
}
