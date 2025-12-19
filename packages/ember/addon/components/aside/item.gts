import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { faCircle } from '@fortawesome/free-solid-svg-icons';
import Icon from '../icon';
import type { LinkArgs } from '../link';
import NavItem from '../nav/item';

interface Args extends LinkArgs {
  label: string;
  icon?: IconDefinition;
  count?: number;
  trailingIcon?: IconDefinition;
  isDisabled?: boolean;
}

export interface AsideItemSignature {
  Args: Args;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

<template>
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
</template> satisfies TOC<AsideItemSignature>;
