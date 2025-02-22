import Badge from '../../badge';
import Icon from '../../icon';

import type { TOC } from '@ember/component/template-only';
import type { IconName } from '@fortawesome/fontawesome-svg-core';

export interface NavItemInternalSignature {
  Args: {
    label?: string;
    icon?: IconName;
    count?: number;
    trailingIcon?: IconName;
  };
  Blocks: {
    default: [];
  };
}

const NavItemInternal: TOC<NavItemInternalSignature> = <template>
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
</template>;

export default NavItemInternal;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Nav::Item::Internal': typeof NavItemInternal;
  }
}
