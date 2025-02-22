import Component from '@glimmer/component';
import { LinkTo } from '@ember/routing';
import Icon from '../icon';
import { concat } from '@ember/helper';

import type { LinkToArgs } from '../button';

interface Args extends LinkToArgs {
  label?: string;
  subtitle?: string;
  icon?: string;
  shortcut?: string;
  color?: string;
  href?: string;
}

export interface DropdownItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class DropdownItem extends Component<DropdownItemSignature> {
  <template>
    {{#if (and @route @model)}}
      <LinkTo
        @route={{@route}}
        @model={{@model}}
        class="dropdown-item d-flex align-items-center gap-2
          {{if @color (concat 'text-' @color)}}"
        ...attributes
      >
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
      </LinkTo>
    {{else if @route}}
      <LinkTo
        @route={{@route}}
        class="dropdown-item d-flex align-items-center gap-2
          {{if @color (concat 'text-' @color)}}"
        ...attributes
      >
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
      </LinkTo>
    {{else if @href}}
      <a
        href={{@href}}
        target="_blank"
        rel="noopener noreferrer"
        class="dropdown-item d-flex align-items-center gap-2
          {{if @color (concat 'text-' @color)}}"
        ...attributes
      >
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
      </a>
    {{else}}
      <button
        type="button"
        class="dropdown-item d-flex align-items-center gap-2
          {{if @color (concat 'text-' @color)}}"
        ...attributes
      >
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
      </button>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Item': typeof DropdownItem;
  }
}
