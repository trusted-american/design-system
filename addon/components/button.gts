import Badge from './badge';
import Icon from './icon';
import Link, { type LinkArgs } from './link';
import Spinner from './spinner';
import { concat } from '@ember/helper';
import { and, eq, not, or } from 'ember-truth-helpers';
import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';

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
      class="no-underline text-white focus:ring-4 font-medium rounded-lg text-sm px-5 py-2.5 focus:outline-none
        {{if
          (eq 'primary' @color)
          'bg-blue-700 hover:bg-blue-800 focus:ring-blue-300'
          (if
            (eq 'success' @color)
            'bg-green-700 hover:bg-green-800 focus:ring-green-300'
            (if
              (eq 'danger' @color)
              'bg-red-700 hover:bg-red-800 focus:ring-red-300'
              (if
                (eq 'warning' @color)
                'text-yellow-800 bg-yellow-50 border-yellow-300'
                (if
                  (eq 'info' @color)
                  'text-sky-800 bg-sky-50 border-sky-300'
                  'text-gray-800 bg-gray-50 border-gray-300'
                )
              )
            )
          )
        }}
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
        {{if @isFullWidth 'w-full'}}
        text-nowrap"
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
      class="text-white focus:ring-4 font-medium rounded-lg text-sm px-5 py-2.5 focus:outline-none
        {{if
          (eq 'primary' @color)
          'bg-blue-700 hover:bg-blue-800 focus:ring-blue-300'
          (if
            (eq 'success' @color)
            'bg-green-700 hover:bg-green-800 focus:ring-green-300'
            (if
              (eq 'danger' @color)
              'bg-red-700 hover:bg-red-800 focus:ring-red-300'
              (if
                (eq 'warning' @color)
                'text-yellow-800 bg-yellow-50 border-yellow-300'
                (if
                  (eq 'info' @color)
                  'text-sky-800 bg-sky-50 border-sky-300'
                  'text-gray-800 bg-gray-50 border-gray-300'
                )
              )
            )
          )
        }}
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
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
      class="px-5 py-2.5
        {{if
          (eq 'primary' @color)
          'text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm'
          (if
            (eq 'success' @color)
            'focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm'
            (if
              (eq 'danger' @color)
              'focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm'
              (if
                (eq 'warning' @color)
                'focus:outline-none text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm'
                (if
                  (eq 'info' @color)
                  ''
                  'text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100'
                )
              )
            )
          )
        }}
        {{if @size (concat 'btn-' @size)}}
        btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
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
