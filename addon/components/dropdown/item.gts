import Component from '@glimmer/component';
import { LinkTo } from '@ember/routing';
import { concat } from '@ember/helper';
import FaIcon from '@fortawesome/ember-fontawesome/components/fa-icon';

export interface DropdownItemSignature {
  Element: HTMLElement;
  Args: {
    text: string;
    icon?: string;
    color?: string;
    route?: string;
    href?: string;
  };
}

export default class DropdownItem extends Component<DropdownItemSignature> {
  <template>
    {{#if @route}}
      <LinkTo
        @route={{@route}}
        class='dropdown-item {{if @color (concat "text-" @color)}}'
        ...attributes
      >
        {{#if @icon}}
          <FaIcon @icon={{@icon}} @fixedWidth={{true}} class='me-1' />
        {{/if}}
        {{@text}}
      </LinkTo>
    {{else if @href}}
      <a
        href={{@href}}
        target='_blank'
        rel='noopener noreferrer'
        class='dropdown-item {{if @color (concat "text-" @color)}}'
        ...attributes
      >
        {{#if @icon}}
          <FaIcon @icon={{@icon}} @fixedWidth={{true}} class='me-1' />
        {{/if}}
        {{@text}}
      </a>
    {{else}}
      <button
        type='button'
        class='dropdown-item {{if @color (concat "text-" @color)}}'
        ...attributes
      >
        {{#if @icon}}
          <FaIcon @icon={{@icon}} @fixedWidth={{true}} class='me-1' />
        {{/if}}
        {{@text}}
      </button>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Dropdown::Item': typeof DropdownItem;
  }
}
