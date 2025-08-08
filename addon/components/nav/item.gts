import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { or } from 'ember-truth-helpers';
import Badge from '../badge';
import Icon from '../icon';
import Link, { type LinkArgs } from '../link';

const Internal: TOC<{
  Args: {
    label?: string;
    icon?: IconDefinition;
    count?: number;
    trailingIcon?: IconDefinition;
  };
  Blocks: {
    default: [];
  };
}> = <template>
  {{#if @icon}}
    <Icon @icon={{@icon}} @isFixedWidth={{true}} class="me-1" />
  {{/if}}
  {{#if @label}}{{@label}}{{/if}}
  {{yield}}
  <div class="inline float-end">
    {{#if @count}}
      <Badge @label="{{@count}}" @isPill={{true}} class="ms-2" />
    {{/if}}
    {{#if @trailingIcon}}
      <Icon @icon={{@trailingIcon}} @isFixedWidth={{true}} class="ms-2" />
    {{/if}}
  </div>
</template>;

interface Args extends LinkArgs {
  label?: string;
  icon?: IconDefinition;
  count?: number;
  trailingIcon?: IconDefinition;
  isDisabled?: boolean;
  isPills?: boolean;
}

export interface NavItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

const NavItem: TOC<NavItemSignature> = <template>
  {{!-- TODO: {{if @isDisabled 'disabled'}} --}}
  <li class="me-2">
    {{#if (or @route @model @query @href)}}
      <Link
        @route={{@route}}
        @model={{@model}}
        @query={{@query}}
        @href={{@href}}
        @isLocalHref={{@isLocalHref}}
        class="text-inherit !no-underline
          {{if
            @isPills
            'block px-4 py-3 rounded-lg hover:text-gray-900 hover:bg-gray-100 ember-active:text-white ember-active:bg-blue-600'
            'block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 ember-active:text-blue-600 ember-active:border-blue-600'
          }}"
        data-test-nav-item
        ...attributes
      >
        <Internal
          @label={{@label}}
          @icon={{@icon}}
          @count={{@count}}
          @trailingIcon={{@trailingIcon}}
        >
          {{yield}}
        </Internal>
      </Link>
    {{else}}
      <a
        href="#"
        class={{if
          @isPills
          "block px-4 py-3 rounded-lg hover:text-gray-900 hover:bg-gray-100 ember-active:text-white ember-active:bg-blue-600"
          "block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 ember-active:text-blue-600 ember-active:border-blue-600"
        }}
        data-test-nav-item
        ...attributes
      >
        <Internal
          @label={{@label}}
          @icon={{@icon}}
          @count={{@count}}
          @trailingIcon={{@trailingIcon}}
        >
          {{yield}}
        </Internal>
      </a>
    {{/if}}
  </li>
</template>;

export default NavItem;
