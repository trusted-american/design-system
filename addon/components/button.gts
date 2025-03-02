import Badge from './badge';
import Icon from './icon';
import Link, { type LinkToArgs } from './link';
import SpinnerInternal from './spinner/internal';
import { concat } from '@ember/helper';
import { and, not } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';
import type { IconName, IconPrefix } from '@fortawesome/fontawesome-svg-core';

const Internal: TOC<{
  Args: {
    label: string;
    icon?: IconName;
    iconPrefix?: IconPrefix;
    isIconTrailing?: boolean;
    isIconOnly?: boolean;
    isLoading?: boolean;
    count?: number;
    shortcut?: string;
  };
  Element: SVGElement;
}> = <template>
  {{#if @isLoading}}
    <SpinnerInternal />
  {{/if}}
  {{if (and (not @isIconOnly) @isIconTrailing) @label}}
  {{#if @icon}}
    <Icon
      @icon={{@icon}}
      @prefix={{@iconPrefix}}
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

interface Args extends LinkToArgs {
  isSubmit?: true;
  label: string;
  icon?: IconName;
  iconPrefix?: IconPrefix;
  isIconTrailing?: boolean;
  isIconOnly?: boolean;
  size?: 'sm' | 'lg';
  isOutline?: boolean;
  isFullWidth?: boolean;
  color?: string;
  isLoading?: boolean;
  href?: string;
  count?: number;
  isLabel?: boolean;
  isLocalHref?: boolean;
  shortcut?: string;
}

export interface ButtonSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLButtonElement | HTMLAnchorElement | HTMLLabelElement;
}

const Button: TOC<ButtonSignature> = <template>
  {{#if @route}}
    <Link
      @route={{@route}}
      @model={{@model}}
      @query={{@query}}
      class="btn
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
        {{if @isFullWidth 'w-100'}}
        text-nowrap"
      role="button"
      data-test-button
      ...attributes
    >
      <Internal
        @label={{@label}}
        @icon={{@icon}}
        @iconPrefix={{@iconPrefix}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
        @isLoading={{@isLoading}}
        @count={{@count}}
        @shortcut={{@shortcut}}
        role="presentation"
      />
    </Link>
  {{else if @href}}
    {{#if @isLocalHref}}
      <a
        href={{@href}}
        class="btn
          {{if @size (concat 'btn-' @size)}}
          btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
          {{if @isFullWidth 'w-100'}}
          text-nowrap"
        role="button"
        data-test-button
        ...attributes
      >
        <Internal
          @label={{@label}}
          @icon={{@icon}}
          @iconPrefix={{@iconPrefix}}
          @isIconTrailing={{@isIconTrailing}}
          @isIconOnly={{@isIconOnly}}
          @isLoading={{@isLoading}}
          @count={{@count}}
          @shortcut={{@shortcut}}
          role="presentation"
        />
      </a>
    {{else}}
      <Link
        @href={{@href}}
        @label={{@label}}
        @icon={{@icon}}
        @iconPrefix={{@iconPrefix}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
        class="btn
          {{if @size (concat 'btn-' @size)}}
          btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
          {{if @isFullWidth 'w-100'}}
          text-nowrap"
        role="button"
        data-test-button
        ...attributes
      />
    {{/if}}
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
        @iconPrefix={{@iconPrefix}}
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
      type={{if @isSubmit "submit" "button"}}
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
        @iconPrefix={{@iconPrefix}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
        @isLoading={{@isLoading}}
        @count={{@count}}
        @shortcut={{@shortcut}}
        role="presentation"
      />
    </button>
  {{/if}}
</template>;

export default Button;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof Button;
  }
}
