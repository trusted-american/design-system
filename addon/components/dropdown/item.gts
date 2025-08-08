import Link, { type LinkArgs } from '../link';
import Icon from '../icon';
import { or } from 'ember-truth-helpers';
import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { get } from '@ember/helper';

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
    <Icon @icon={{@icon}} @isFixedWidth={{true}} class="text-gray-500" />
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

const colorVariants = {
  primary: 'text-blue-500',
  secondary: '',
  success: 'text-green-500',
  danger: 'text-red-500',
  warning: 'text-yellow-500',
  info: 'text-sky-500',
  light: '',
  dark: '',
};

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
        {{if @color (get colorVariants @color)}}"
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
        {{if @color (get colorVariants @color)}}"
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
