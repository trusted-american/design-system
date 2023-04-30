import Component from '@glimmer/component';
import { concat } from '@ember/helper';
import tooltip from 'ember-simple-bootstrap/modifiers/tooltip';
import CopyButton from 'ember-cli-clipboard/components/copy-button';

export interface PropertyListItemSignature {
  Element: HTMLElement;
  Args: {
    key: string | number;
    value?: string | null;
    alt?: unknown;
    tooltip?: string;
    horizontal?: boolean;
  };
  Blocks: {
    default: [];
  };
}

export default class PropertyListItem extends Component<PropertyListItemSignature> {
  <template>
    {{#if @horizontal}}
      <div class='col-auto border-end'>
        <dt class='text-secondary'>
          {{@key}}
          {{#if @tooltip}}
            <a href='#' class='text-secondary ms-2'>
              <i class='fas fa-info-circle' {{tooltip @tooltip}}></i>
            </a>
          {{/if}}
        </dt>
        <dd class='' ...attributes>
          {{#if @alt}}
            <span class='text-disabled'>
              No
              {{@key}}
            </span>
          {{else}}
            {{#if @value}}
              <CopyButton @text={{@value}} {{tooltip (concat 'Copy ' @key)}}>
                {{yield}}
              </CopyButton>
            {{else}}
              {{yield}}
            {{/if}}
          {{/if}}
        </dd>
      </div>
    {{else}}
      <dt class='col-5 text-secondary'>
        {{@key}}
      </dt>
      <dd class='col-7 overflow-hidden' ...attributes>
        {{#if @alt}}
          <span class='text-disabled'>
            No
            {{@key}}
          </span>
        {{else}}
          {{#if @value}}
            <CopyButton @text={{@value}} {{tooltip (concat 'Copy ' @key)}}>
              {{yield}}
            </CopyButton>
          {{else}}
            {{yield}}
          {{/if}}
        {{/if}}
      </dd>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'PropertyList::Item': typeof PropertyListItem;
    'property-list/item': typeof PropertyListItem;
  }
}
