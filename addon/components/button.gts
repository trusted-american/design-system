import Component from '@glimmer/component';
import ButtonInternal from './button/internal';
import ExternalLink from './external-link';
import { LinkTo } from '@ember/routing';
import { concat } from '@ember/helper';
import { and } from 'ember-truth-helpers';

import type { IconPrefix } from '@fortawesome/fontawesome-svg-core';

export interface LinkToArgs {
  route?: string;
  model?: unknown;
  query?: Record<string, unknown>;
}

interface Args extends LinkToArgs {
  isSubmit?: true;
  label: string;
  icon?: string;
  iconPrefix?: IconPrefix;
  isIconTrailing?: boolean;
  isIconOnly?: boolean;
  size?: 'sm' | 'lg';
  isOutline?: boolean;
  isFullWidth?: boolean;
  color?: string;
  isLoading?: boolean;
  href?: string;
  count?: number;
  isLabel?: boolean;
  isLocalHref?: boolean;
  shortcut?: string;
}

export interface ButtonSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLButtonElement | HTMLAnchorElement | HTMLLabelElement;
}

export default class Button extends Component<ButtonSignature> {
  <template>
    {{#if (and @route @query)}}
      <LinkTo
        @route={{@route}}
        @query={{@query}}
        class="btn
          {{if @size (concat 'btn-' @size)}}
          btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
          {{if @isFullWidth 'w-100'}}
          text-nowrap"
        role="button"
        data-test-button
        ...attributes
      >
        <ButtonInternal
          @label={{@label}}
          @icon={{@icon}}
          @iconPrefix={{@iconPrefix}}
          @isIconTrailing={{@isIconTrailing}}
          @isIconOnly={{@isIconOnly}}
          @isLoading={{@isLoading}}
          @count={{@count}}
          @shortcut={{@shortcut}}
          role="presentation"
        />
      </LinkTo>
    {{else if @route}}
      <LinkTo
        @route={{@route}}
        class="btn
          {{if @size (concat 'btn-' @size)}}
          btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
          {{if @isFullWidth 'w-100'}}
          text-nowrap"
        role="button"
        data-test-button
        ...attributes
      >
        <ButtonInternal
          @label={{@label}}
          @icon={{@icon}}
          @iconPrefix={{@iconPrefix}}
          @isIconTrailing={{@isIconTrailing}}
          @isIconOnly={{@isIconOnly}}
          @isLoading={{@isLoading}}
          @count={{@count}}
          @shortcut={{@shortcut}}
          role="presentation"
        />
      </LinkTo>
    {{else if @query}}
      <LinkTo
        @query={{@query}}
        class="btn
          {{if @size (concat 'btn-' @size)}}
          btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
          {{if @isFullWidth 'w-100'}}
          text-nowrap"
        role="button"
        data-test-button
        ...attributes
      >
        <ButtonInternal
          @label={{@label}}
          @icon={{@icon}}
          @iconPrefix={{@iconPrefix}}
          @isIconTrailing={{@isIconTrailing}}
          @isIconOnly={{@isIconOnly}}
          @isLoading={{@isLoading}}
          @count={{@count}}
          @shortcut={{@shortcut}}
          role="presentation"
        />
      </LinkTo>
    {{else if @href}}
      {{#if @isLocalHref}}
        <a
          href={{@href}}
          class="btn
            {{if @size (concat 'btn-' @size)}}
            btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
            {{if @isFullWidth 'w-100'}}
            text-nowrap"
          role="button"
          data-test-button
          ...attributes
        >
          <ButtonInternal
            @label={{@label}}
            @icon={{@icon}}
            @iconPrefix={{@iconPrefix}}
            @isIconTrailing={{@isIconTrailing}}
            @isIconOnly={{@isIconOnly}}
            @isLoading={{@isLoading}}
            @count={{@count}}
            @shortcut={{@shortcut}}
            role="presentation"
          />
        </a>
      {{else}}
        <ExternalLink
          @href={{@href}}
          @label={{@label}}
          @icon={{@icon}}
          @iconPrefix={{@iconPrefix}}
          @isIconTrailing={{@isIconTrailing}}
          @isIconOnly={{@isIconOnly}}
          class="btn
            {{if @size (concat 'btn-' @size)}}
            btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
            {{if @isFullWidth 'w-100'}}
            text-nowrap"
          role="button"
          data-test-button
          ...attributes
        />
      {{/if}}
    {{else if @isLabel}}
      <label
        class="btn
          {{if @size (concat 'btn-' @size)}}
          btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
          {{if @isFullWidth 'w-100'}}
          text-nowrap"
        data-test-button
        ...attributes
      >
        <ButtonInternal
          @label={{@label}}
          @icon={{@icon}}
          @iconPrefix={{@iconPrefix}}
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
        type={{if @isSubmit "submit" "button"}}
        class="btn
          {{if @size (concat 'btn-' @size)}}
          btn-{{if @isOutline 'outline-' ''}}{{if @color @color 'secondary'}}
          {{if @isFullWidth 'w-100'}}
          text-nowrap"
        disabled={{if @isLoading true}}
        aria-label={{if @isIconOnly @label}}
        data-test-button
        ...attributes
      >
        <ButtonInternal
          @label={{@label}}
          @icon={{@icon}}
          @iconPrefix={{@iconPrefix}}
          @isIconTrailing={{@isIconTrailing}}
          @isIconOnly={{@isIconOnly}}
          @isLoading={{@isLoading}}
          @count={{@count}}
          @shortcut={{@shortcut}}
          role="presentation"
        />
      </button>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof Button;
  }
}
