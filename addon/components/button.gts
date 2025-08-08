import type { TOC } from '@ember/component/template-only';
import { concat, get } from '@ember/helper';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { and, not, or } from 'ember-truth-helpers';
import Badge from './badge';
import Icon from './icon';
import Link, { type LinkArgs } from './link';
import Spinner from './spinner';

const Internal: TOC<{
  Args: {
    label: string;
    icon?: IconDefinition;
    isIconTrailing?: boolean;
    isIconOnly?: boolean;
    isLoading?: boolean;
    count?: number;
    shortcut?: string;
  };
  Element: SVGElement;
}> = <template>
  {{#if @isLoading}}
    <Spinner @color="white" />
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

const colorVariants = {
  primary: 'text-white focus:ring-blue-300 bg-blue-700 hover:bg-blue-800',
  secondary:
    'focus:ring-gray-100 bg-white text-gray-900 focus:z-10 border border-gray-200 hover:bg-gray-100 hover:text-blue-700',
  success: 'text-white bg-green-700 hover:bg-green-800 focus:ring-green-300',
  danger: 'text-white bg-red-700 hover:bg-red-800 focus:ring-red-300',
  warning: 'text-white text-yellow-800 bg-yellow-50 border-yellow-300',
  info: 'text-white text-sky-800 bg-sky-50 border-sky-300',
  light: '',
  dark: '',
};

interface Args extends LinkArgs {
  type?: string;
  label: string;
  icon?: IconDefinition;
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
  isDisabled?: boolean;
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
      class="!no-underline font-medium rounded-lg text-sm px-5 py-2.5 focus:outline-none focus:ring-4
        {{get colorVariants (or @color 'secondary')}}
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}
        {{if @isFullWidth 'w-full'}}
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
      class="font-medium rounded-lg text-sm px-5 py-2.5 focus:outline-none focus:ring-4
        {{get colorVariants (or @color 'secondary')}}
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}
        {{if @isFullWidth 'w-full'}}
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
      class="font-medium rounded-lg text-sm px-5 py-2.5 focus:outline-none focus:ring-4
        {{get colorVariants (or @color 'secondary')}}
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}
        {{if @isFullWidth 'w-full'}}
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
</template>;

export default Button;
