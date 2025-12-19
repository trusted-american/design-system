import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { or } from 'ember-truth-helpers';
import Badge from '../badge';
import Icon from '../icon';
import Link, { type LinkArgs } from '../link';

const Internal: TOC<{
  Args: {
    label?: string;
    icon?: IconDefinition;
    count?: number;
    trailingIcon?: IconDefinition;
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

interface Args extends LinkArgs {
  label?: string;
  icon?: IconDefinition;
  count?: number;
  trailingIcon?: IconDefinition;
  isDisabled?: boolean;
}

export interface NavItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

<template>
  {{#if (or @route @model @query @href)}}
    <Link
      @route={{@route}}
      @model={{@model}}
      @query={{@query}}
      @href={{@href}}
      @isLocalHref={{@isLocalHref}}
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
</template> satisfies TOC<NavItemSignature>;
