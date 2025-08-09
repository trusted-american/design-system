import type { TOC } from '@ember/component/template-only';
import { get } from '@ember/helper';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { and, not, or, eq } from 'ember-truth-helpers';
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
    size?: 'sm' | 'lg';
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
  primary: 'text-white bg-blue-800 hover:bg-blue-900 focus:ring-blue-600',
  secondary: 'text-white bg-gray-500 hover:bg-gray-600 focus:ring-gray-500',
  success: 'text-white bg-green-800 hover:bg-green-900 focus:ring-green-700',
  danger: 'text-white bg-red-800 hover:bg-red-900 focus:ring-red-700',
  warning: 'text-white bg-yellow-600 hover:bg-yellow-700 focus:ring-yellow-600',
  info: 'text-white bg-sky-700 hover:bg-sky-800 focus:ring-sky-600',
  light: '',
  dark: '',
};

const outlineColorVariants = {
  primary:
    'text-blue-700 bg-white border border-blue-700 hover:bg-blue-50 focus:ring-blue-500',
  secondary:
    'text-gray-700 bg-white border border-gray-700 hover:bg-gray-50 focus:ring-gray-500',
  success:
    'text-green-700 bg-white border border-green-700 hover:bg-green-50 focus:ring-green-600',
  danger:
    'text-red-700 bg-white border border-red-700 hover:bg-red-50 focus:ring-red-500',
  warning:
    'text-yellow-700 bg-white border border-yellow-700 hover:bg-yellow-50 focus:ring-yellow-500',
  info: 'text-sky-700 bg-white border border-sky-700 hover:bg-sky-50 focus:ring-sky-500',
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
      class="no-underline focus:ring-4 font-medium rounded-lg text-sm focus:outline-none
        {{if
          @isOutline
          (get outlineColorVariants (or @color 'secondary'))
          (get colorVariants (or @color 'secondary'))
        }}
        {{if
          (eq @size 'sm')
          'px-2 py-1 text-sm'
          (if (eq @size 'lg') 'px-4 py-2 text-lg' 'px-3 py-1.5')
        }}
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
        @size={{@size}}
        role="presentation"
      />
    </Link>
  {{else if @isLabel}}
    <label
      class="focus:ring-4 font-medium rounded-lg text-sm focus:outline-none
        {{if
          @isOutline
          (get outlineColorVariants (or @color 'secondary'))
          (get colorVariants (or @color 'secondary'))
        }}
        {{if
          (eq @size 'sm')
          'px-2 py-1 text-sm'
          (if (eq @size 'lg') 'px-4 py-2 text-lg' 'px-3 py-1.5')
        }}
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
        @size={{@size}}
        role="presentation"
      />
      {{yield}}
    </label>
  {{else}}
    <button
      type={{if @type @type "button"}}
      class="font-medium rounded-lg focus:outline-none focus:ring-4
        {{if
          @isOutline
          (get outlineColorVariants (or @color 'secondary'))
          (get colorVariants (or @color 'secondary'))
        }}
        {{if
          (eq @size 'sm')
          'px-2 py-1 text-sm'
          (if (eq @size 'lg') 'px-4 py-2 text-lg' 'px-3 py-1.5')
        }}
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
        @size={{@size}}
        role="presentation"
      />
    </button>
  {{/if}}
</template>;

export default Button;
