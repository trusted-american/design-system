import Component from '@glimmer/component';
import ExternalLink from './external-link';
import BsButton from 'ember-simple-bootstrap/components/bs/button';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';
import and from 'ember-truth-helpers/helpers/and';
import not from 'ember-truth-helpers/helpers/not';
import { LinkTo } from '@ember/routing';
import { concat } from '@ember/helper';

export interface ButtonSignature {
  Element: HTMLButtonElement | HTMLAnchorElement;
  Args: {
    isSubmit?: true;
    text: string;
    icon?: string;
    iconTrailing?: boolean;
    iconOnly?: boolean;
    size?: 'sm' | 'lg';
    outline?: boolean;
    color?: string;
    loading?: unknown;
    route?: string;
    href?: string;
  };
}

export default class Button extends Component<ButtonSignature> {
  <template>
    {{#if @route}}
      {{! template-lint-disable require-presentational-children }}
      <LinkTo
        @route={{@route}}
        class="btn
          {{if @size (concat 'btn-' @size)}}
          btn-{{if @outline 'outline-' ''}}{{if @color @color 'secondary'}}"
        role="button"
        ...attributes
      >
        {{if (and (not @iconOnly) @iconTrailing) @text}}
        {{#if @icon}}
          <FaIcon
            @icon={{@icon}}
            class={{unless @iconOnly (if @iconTrailing "ms-1" "me-1")}}
          />
        {{/if}}
        {{if (and (not @iconOnly) (not @iconTrailing)) @text}}
      </LinkTo>
    {{else if @href}}
      <ExternalLink
        @text={{@text}}
        @icon={{@icon}}
        @href={{@href}}
        class="btn
          {{if @size (concat 'btn-' @size)}}
          btn-{{if @outline 'outline-' ''}}{{if @color @color 'secondary'}}"
        role="button"
        ...attributes
      />
    {{else}}
      <BsButton
        @isSubmit={{@isSubmit}}
        @size={{@size}}
        @outline={{@outline}}
        @color={{if @color @color "secondary"}}
        disabled={{if @loading true}}
        aria-label={{if @iconOnly @text}}
        ...attributes
      >
        {{#if @loading}}
          <span class="spinner-border spinner-border-sm" role="status"></span>
        {{/if}}
        {{if (and (not @iconOnly) @iconTrailing) @text}}
        {{#if @icon}}
          <FaIcon
            @icon={{@icon}}
            class={{unless @iconOnly (if @iconTrailing "ms-1" "me-1")}}
          />
        {{/if}}
        {{if (and (not @iconOnly) (not @iconTrailing)) @text}}
      </BsButton>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof Button;
  }
}
