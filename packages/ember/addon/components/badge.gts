import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import type { Color } from '@trusted-american/core';
import Icon from './icon';
import Spinner from './spinner';

export interface BadgeSignature {
  Args: {
    label?: string;
    color?: Color;
    icon?: IconDefinition;
    isPill?: boolean;
    isLoading?: boolean;
  };
  Element: HTMLElement;
}

<template>
  <span
    class="badge text-bg-{{if @color @color 'secondary'}}
      {{if @isPill 'rounded-pill'}}"
    data-test-badge
    ...attributes
  >
    {{#if @isLoading}}
      <Spinner @color="white" />
    {{/if}}
    {{#if @icon}}
      <Icon @icon={{@icon}} class={{if @label "me-1"}} />
    {{/if}}
    {{@label}}
  </span>
</template> satisfies TOC<BadgeSignature>;
