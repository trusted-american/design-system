import Link, { type LinkArgs } from '../link';
import Icon from '../icon';
import { eq, or } from 'ember-truth-helpers';
import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';

const Internal: TOC<{
  Args: {
    label?: string;
    subtitle?: string;
    icon?: IconDefinition;
    shortcut?: string;
  };
  Blocks: {
    default: [];
  };
}> = <template>
  {{#if @icon}}
    <Icon @icon={{@icon}} @isFixedWidth={{true}} />
  {{/if}}
  <div>
    {{#if @label}}{{@label}}{{else}}{{yield}}{{/if}}
    {{#if @subtitle}}
      <br />
      <span class="text-sm">{{@subtitle}}</span>
    {{/if}}
  </div>
  {{#if @shortcut}}
    <span class="text-gray-500 ms-auto">{{@shortcut}}</span>
  {{/if}}
</template>;

interface Args extends LinkArgs {
  color?: string;
  label?: string;
  subtitle?: string;
  icon?: IconDefinition;
  shortcut?: string;
}

export interface DropdownItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

const DropdownItem: TOC<DropdownItemSignature> = <template>
  {{#if (or @route @model @query @href)}}
    <Link
      @route={{@route}}
      @model={{@model}}
      @query={{@query}}
      @href={{@href}}
      @isLocalHref={{@isLocalHref}}
      class="w-full px-4 py-1 flex items-center gap-2 hover:bg-gray-100
        {{if
          (eq 'primary' @color)
          'text-blue-500'
          (if
            (eq 'success' @color)
            'text-green-500'
            (if
              (eq 'danger' @color)
              'text-red-500'
              (if
                (eq 'warning' @color)
                'text-yellow-500'
                (if (eq 'info' @color) 'text-sky-500' '')
              )
            )
          )
        }}"
      ...attributes
    >
      <Internal
        @label={{@label}}
        @subtitle={{@subtitle}}
        @icon={{@icon}}
        @shortcut={{@shortcut}}
      >{{yield}}</Internal>
    </Link>
  {{else}}
    <button
      type="button"
      class="w-full px-4 py-1 flex items-center gap-2 hover:bg-gray-100
        {{if
          (eq 'primary' @color)
          'text-blue-500'
          (if
            (eq 'success' @color)
            'text-green-500'
            (if
              (eq 'danger' @color)
              'text-red-500'
              (if
                (eq 'warning' @color)
                'text-yellow-500'
                (if (eq 'info' @color) 'text-sky-500' '')
              )
            )
          )
        }}"
      ...attributes
    >
      <Internal
        @label={{@label}}
        @subtitle={{@subtitle}}
        @icon={{@icon}}
        @shortcut={{@shortcut}}
      >{{yield}}</Internal>
    </button>
  {{/if}}
</template>;

export default DropdownItem;
