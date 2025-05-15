import NavItem from '../nav/item';
import Icon from '../icon';
import { faCircle } from '@fortawesome/free-solid-svg-icons';

import type { TOC } from '@ember/component/template-only';
import type {
  IconDefinition,
  IconName,
} from '@fortawesome/fontawesome-svg-core';
import type { LinkArgs } from '../link';

interface Args extends LinkArgs {
  label: string;
  icon?: IconName | IconDefinition;
  count?: number;
  trailingIcon?: IconName | IconDefinition;
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
    @href={{@href}}
    @icon={{@icon}}
    @count={{@count}}
    @trailingIcon={{@trailingIcon}}
    @isDisabled={{@isDisabled}}
    class="px-2 py-1"
    ...attributes
  >
    {{#unless @icon}}
      <Icon @icon={{faCircle}} @isFixedWidth={{true}} class="me-1 invisible" />
    {{/unless}}
    <span>{{@label}}</span>
    {{yield}}
  </NavItem>
</template>;

export default AsideItem;
