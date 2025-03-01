import { LinkTo } from '@ember/routing';
import { and } from 'ember-truth-helpers';
import Icon from './icon';

import type { TOC } from '@ember/component/template-only';
import type { IconName, IconPrefix } from '@fortawesome/fontawesome-svg-core';

const Internal: TOC<{
  Args: {
    label?: string;
    icon?: IconName;
    iconPrefix?: IconPrefix;
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
      @prefix={{@iconPrefix}}
      class={{unless @isIconOnly (if @isIconTrailing "ms-1" "me-1")}}
    />
  {{/if}}
  {{#unless @isIconOnly}}
    {{#unless @isIconTrailing}}
      {{#if @label}}{{@label}}{{else}}{{yield}}{{/if}}{{/unless}}{{/unless}}
</template>;

export interface LinkToArgs {
  route?: string;
  model?: unknown;
  query?: Record<string, unknown>;
}

interface Args extends LinkToArgs {
  href?: string;
  label?: string;
  icon?: IconName;
  iconPrefix?: IconPrefix;
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
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @iconPrefix={{@iconPrefix}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal>
    </LinkTo>
  {{else if (and @route @model)}}
    <LinkTo
      @route={{@route}}
      @model={{@model}}
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @iconPrefix={{@iconPrefix}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else if @route}}
    <LinkTo @route={{@route}} data-test-link ...attributes><Internal
        @label={{@label}}
        @icon={{@icon}}
        @iconPrefix={{@iconPrefix}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else if @model}}
    <LinkTo @model={{@model}} data-test-link ...attributes><Internal
        @label={{@label}}
        @icon={{@icon}}
        @iconPrefix={{@iconPrefix}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else if @query}}
    <LinkTo @query={{@query}} data-test-link ...attributes><Internal
        @label={{@label}}
        @icon={{@icon}}
        @iconPrefix={{@iconPrefix}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></LinkTo>
  {{else}}
    <a
      href={{@href}}
      target="_blank"
      rel="noopener noreferrer"
      data-test-link
      ...attributes
    ><Internal
        @label={{@label}}
        @icon={{@icon}}
        @iconPrefix={{@iconPrefix}}
        @isIconTrailing={{@isIconTrailing}}
        @isIconOnly={{@isIconOnly}}
      >{{yield}}</Internal></a>
  {{/if}}
</template>;

export default Link;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Link: typeof Link;
  }
}
