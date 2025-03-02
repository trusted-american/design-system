import Link, { type LinkToArgs } from '../link';
import Icon from '../icon';
import { concat } from '@ember/helper';
import { or } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';
import type { IconName } from '@fortawesome/fontawesome-svg-core';

const Internal: TOC<{
  Args: {
    label?: string;
    subtitle?: string;
    icon?: IconName;
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
      <span class="small">{{@subtitle}}</span>
    {{/if}}
  </div>
  {{#if @shortcut}}
    <span class="text-secondary ms-auto">{{@shortcut}}</span>
  {{/if}}
</template>;

interface Args extends LinkToArgs {
  href?: string;
  color?: string;
  label?: string;
  subtitle?: string;
  icon?: IconName;
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
      class="dropdown-item d-flex align-items-center gap-2
        {{if @color (concat 'text-' @color)}}"
      ...attributes
    >
      <Internal
        @label={{@label}}
        @subtitle={{@subtitle}}
        @icon={{@icon}}
        @shortcut={{@shortcut}}
      />
    </Link>
  {{else}}
    <button
      type="button"
      class="dropdown-item d-flex align-items-center gap-2
        {{if @color (concat 'text-' @color)}}"
      ...attributes
    >
      <Internal
        @label={{@label}}
        @subtitle={{@subtitle}}
        @icon={{@icon}}
        @shortcut={{@shortcut}}
      />
    </button>
  {{/if}}
</template>;

export default DropdownItem;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Item': typeof DropdownItem;
  }
}
