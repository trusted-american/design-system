import type { TOC } from '@ember/component/template-only';
import { LinkTo } from '@ember/routing';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { and } from 'ember-truth-helpers';
import Icon from './icon';

const Internal: TOC<{
  Args: {
    label?: string;
    icon?: IconDefinition;
    isIconTrailing?: boolean;
    isIconOnly?: boolean;
  };
  Blocks: {
    default: [];
  };
}> = <template>
  {{#unless @isIconOnly}}
    {{#if @isIconTrailing}}
      {{#if @label}}{{@label}}{{else}}{{yield}}{{/if}}{{/if}}{{/unless}}
  {{#if @icon}}
    <Icon
      @icon={{@icon}}
      class={{unless @isIconOnly (if @isIconTrailing "ms-1" "me-1")}}
    />
  {{/if}}
  {{#unless @isIconOnly}}
    {{#unless @isIconTrailing}}
      {{#if @label}}{{@label}}{{else}}{{yield}}{{/if}}{{/unless}}{{/unless}}
</template>;

export interface LinkArgs {
  route?: string;
  model?: unknown;
  query?: Record<string, unknown>;
  href?: string;
  isLocalHref?: boolean;
}

interface Args extends LinkArgs {
  label?: string;
  icon?: IconDefinition;
  isIconTrailing?: boolean;
  isIconOnly?: boolean;
}

export interface LinkSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

const Link: TOC<LinkSignature> = <template>
  {{#if (and @route @model @query)}}
    <LinkTo
      @route={{@route}}
      @model={{@model}}
      @query={{@query}}
      class="text-blue-500 underline"
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else if (and @route @query)}}
    <LinkTo
      @route={{@route}}
      @query={{@query}}
      class="text-blue-500 underline"
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else if (and @route @model)}}
    <LinkTo
      @route={{@route}}
      @model={{@model}}
      class="text-blue-500 underline"
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else if @route}}
    <LinkTo
      @route={{@route}}
      class="text-blue-500 underline"
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else if @model}}
    <LinkTo
      @model={{@model}}
      class="text-blue-500 underline"
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else if @query}}
    <LinkTo
      @query={{@query}}
      class="text-blue-500 underline"
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else}}
    <a
      href={{@href}}
      target={{unless @isLocalHref "_blank"}}
      rel={{unless @isLocalHref "noopener noreferrer"}}
      class="text-blue-500 underline"
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></a>
  {{/if}}
</template>;

export default Link;
