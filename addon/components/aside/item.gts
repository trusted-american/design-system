import NavItem from '../nav/item';
import Icon from '../icon';

import type { TOC } from '@ember/component/template-only';
import type { LinkToArgs } from '../button';

interface Args extends LinkToArgs {
  label: string;
  icon?: string;
  count?: number;
  trailingIcon?: string;
  isDisabled?: boolean;
}

export interface AsideItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

const AsideItem: TOC<AsideItemSignature> = <template>
  <NavItem
    @route={{@route}}
    @model={{@model}}
    @query={{@query}}
    @icon={{@icon}}
    @count={{@count}}
    @trailingIcon={{@trailingIcon}}
    @isDisabled={{@isDisabled}}
    class="px-2 py-1"
    ...attributes
  >
    {{#unless @icon}}
      <Icon @icon="circle" @isFixedWidth={{true}} class="me-1 invisible" />
    {{/unless}}
    <span>{{@label}}</span>
    {{yield}}
  </NavItem>
</template>;

export default AsideItem;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Aside::Item': typeof AsideItem;
  }
}
