import Badge from '../badge';
import Icon from '../icon';
import { LinkTo } from '@ember/routing';
import { and } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';
import type { LinkToArgs } from '../button';
import type { IconName } from '@fortawesome/fontawesome-svg-core';

const Item: TOC<{
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
  {{#if (and @route @model @query)}}
    <LinkTo
      @route={{@route}}
      @model={{@model}}
      @query={{@query}}
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <Item
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </Item>
    </LinkTo>
  {{else if (and @route @model)}}
    <LinkTo
      @route={{@route}}
      @model={{@model}}
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <Item
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </Item>
    </LinkTo>
  {{else if @route}}
    <LinkTo
      @route={{@route}}
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <Item
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </Item>
    </LinkTo>
  {{else if @query}}
    <LinkTo
      @query={{@query}}
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <Item
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </Item>
    </LinkTo>
  {{else}}
    <a
      href="#"
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <Item
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </Item>
    </a>
  {{/if}}
</template>;

export default NavItem;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Nav::Item': typeof NavItem;
  }
}
