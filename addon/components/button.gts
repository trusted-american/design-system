import ButtonInternal from './button/internal';
import Link, { type LinkToArgs } from './link';
import { concat } from '@ember/helper';

import type { TOC } from '@ember/component/template-only';
import type { IconName, IconPrefix } from '@fortawesome/fontawesome-svg-core';

interface Args extends LinkToArgs {
  isSubmit?: true;
  label: string;
  icon?: IconName;
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

const Button: TOC<ButtonSignature> = <template>
  {{#if @route}}
    <Link
      @route={{@route}}
      @model={{@model}}
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
    </Link>
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
      <Link
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
</template>;

export default Button;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof Button;
  }
}
