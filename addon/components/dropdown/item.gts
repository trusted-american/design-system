import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { or } from 'ember-truth-helpers';
import Icon from '../icon';
import Link, { type LinkArgs } from '../link';

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
  {{#if @label}}
    <div>
      {{@label}}
      {{#if @subtitle}}
        <br />
        <span class="small">{{@subtitle}}</span>
      {{/if}}
    </div>
  {{/if}}
  {{yield}}
  {{#if @shortcut}}
    <span class="text-secondary ms-auto">{{@shortcut}}</span>
  {{/if}}
</template>;

interface Args extends LinkArgs {
  color?: string;
  label?: string;
  subtitle?: string;
  icon?: IconDefinition;
  shortcut?: string;
  isDisabled?: boolean;
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
      class="dropdown-item d-flex align-items-center gap-2
        {{if @color (concat 'text-' @color)}}
        {{if @isDisabled 'disabled'}}"
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
      class="dropdown-item d-flex align-items-center gap-2
        {{if @color (concat 'text-' @color)}}
        {{if @isDisabled 'disabled'}}"
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
