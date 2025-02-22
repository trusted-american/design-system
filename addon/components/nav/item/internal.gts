import Component from '@glimmer/component';
import Badge from '../../badge';
import Icon from '../../icon';

export interface NavItemInternalSignature {
  Args: {
    label?: string;
    icon?: string;
    count?: number;
    trailingIcon?: string;
  };
  Blocks: {
    default: [];
  };
}

export default class NavItemInternal extends Component<NavItemInternalSignature> {
  <template>
    {{#if @icon}}
      <Icon @icon={{@icon}} @isFixedWidth={{true}} class="me-1" />
    {{/if}}
    {{#if @label}}{{@label}}{{/if}}
    {{yield}}
    <div class="d-inline float-end">
      {{#if @count}}
        <Badge @label="{{@count}}" @isPill={{true}} class="ms-2" />
      {{/if}}
      {{#if @trailingIcon}}
        <Icon @icon={{@trailingIcon}} @isFixedWidth={{true}} class="ms-2" />
      {{/if}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Nav::Item::Internal': typeof NavItemInternal;
  }
}
