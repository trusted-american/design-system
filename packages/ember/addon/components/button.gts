import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import type { Color, Size } from '@trusted-american/core';
import { and, not, or } from 'ember-truth-helpers';
import Badge from './badge';
import Icon from './icon';
import Link, { type LinkArgs } from './link';
import Spinner from './spinner';

const Internal: TOC<{
  Args: {
    label: string;
    icon: IconDefinition | undefined;
    isIconTrailing: boolean | undefined;
    isIconOnly: boolean | undefined;
    isLoading: boolean | undefined;
    count: number | undefined;
    shortcut: string | undefined;
  };
  Element: SVGElement;
}> = <template>
  {{#if @isLoading}}
    <Spinner @color="white" @loadingLabel="Loading…" />
  {{/if}}
  {{if (and (not @isIconOnly) @isIconTrailing) @label}}
  {{#if @icon}}
    <Icon
      @icon={{@icon}}
      class={{unless @isIconOnly (if @isIconTrailing "ms-1" "me-1")}}
      ...attributes
    />
  {{/if}}
  {{if (and (not @isIconOnly) (not @isIconTrailing)) @label}}
  {{#if @count}}
    <Badge @label="{{@count}}" @isPill={{true}} class="ms-1" />
  {{/if}}
  {{#if @shortcut}}
    <kbd>{{@shortcut}}</kbd>
  {{/if}}
</template>;

interface Args extends LinkArgs {
  type?: string;
  label: string;
  icon?: IconDefinition;
  isIconTrailing?: boolean;
  isIconOnly?: boolean;
  size?: Size;
  isOutline?: boolean;
  isFullWidth?: boolean;
  color?: Color;
  isLoading?: boolean;
  count?: number;
  isLabel?: boolean;
  shortcut?: string;
  isDisabled?: boolean;
}

export interface ButtonSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLButtonElement | HTMLAnchorElement | HTMLLabelElement;
}

<template>
  {{#if (or @route @model @query @href)}}
    <Link
      @route={{@route}}
      @model={{@model}}
      @query={{@query}}
      @href={{@href}}
      @isLocalHref={{@isLocalHref}}
      class="btn
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
        {{if @isFullWidth 'w-100'}}
        text-nowrap
        {{if (or @isDisabled @isLoading) 'disabled'}}"
      role="button"
      data-test-button
      ...attributes
    >
      <Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
        @isLoading={{@isLoading}}
        @count={{@count}}
        @shortcut={{@shortcut}}
        role="presentation"
      />
    </Link>
  {{else if @isLabel}}
    <label
      class="btn
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
        {{if @isFullWidth 'w-100'}}
        text-nowrap"
      data-test-button
      ...attributes
    >
      <Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
        @isLoading={{@isLoading}}
        @count={{@count}}
        @shortcut={{@shortcut}}
        role="presentation"
      />
      {{yield}}
    </label>
  {{else}}
    <button
      type={{if @type @type "button"}}
      class="btn
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
        {{if @isFullWidth 'w-100'}}
        text-nowrap"
      disabled={{if @isLoading true}}
      aria-label={{if @isIconOnly @label}}
      data-test-button
      ...attributes
    >
      <Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
        @isLoading={{@isLoading}}
        @count={{@count}}
        @shortcut={{@shortcut}}
        role="presentation"
      />
    </button>
  {{/if}}
</template> satisfies TOC<ButtonSignature>;
