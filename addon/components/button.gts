import Badge from './badge';
import Icon from './icon';
import Link, { type LinkArgs } from './link';
import SpinnerInternal from './spinner/internal';
import { concat } from '@ember/helper';
import { and, not, or } from 'ember-truth-helpers';

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

interface Args extends LinkArgs {
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
  count?: number;
  isLabel?: boolean;
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
