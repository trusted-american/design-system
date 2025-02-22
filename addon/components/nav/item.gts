import NavItemInternal from './item/internal';
import { LinkTo } from '@ember/routing';
import { and } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';
import type { LinkToArgs } from '../button';

interface Args extends LinkToArgs {
  label?: string;
  icon?: string;
  count?: number;
  trailingIcon?: string;
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
      <NavItemInternal
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </NavItemInternal>
    </LinkTo>
  {{else if (and @route @model)}}
    <LinkTo
      @route={{@route}}
      @model={{@model}}
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <NavItemInternal
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </NavItemInternal>
    </LinkTo>
  {{else if @route}}
    <LinkTo
      @route={{@route}}
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <NavItemInternal
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </NavItemInternal>
    </LinkTo>
  {{else if @query}}
    <LinkTo
      @query={{@query}}
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <NavItemInternal
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </NavItemInternal>
    </LinkTo>
  {{else}}
    <a
      href="#"
      class="nav-link text-nowrap {{if @isDisabled 'disabled'}}"
      data-test-nav-item
      ...attributes
    >
      <NavItemInternal
        @label={{@label}}
        @icon={{@icon}}
        @count={{@count}}
        @trailingIcon={{@trailingIcon}}
      >
        {{yield}}
      </NavItemInternal>
    </a>
  {{/if}}
</template>;

export default NavItem;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Nav::Item': typeof NavItem;
  }
}
