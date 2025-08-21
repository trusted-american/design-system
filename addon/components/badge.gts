import type { TOC } from '@ember/component/template-only';
import { get } from '@ember/helper';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { or } from 'ember-truth-helpers';
import Icon from './icon';
import Spinner from './spinner';

const colorVariants = {
  primary: 'bg-blue-100 text-blue-800',
  secondary: 'bg-gray-100 text-gray-800',
  success: 'bg-green-100 text-green-800',
  danger: 'bg-red-100 text-red-800',
  warning: 'bg-yellow-100 text-yellow-800',
  info: 'bg-sky-100 text-sky-800',
  light: '',
  dark: '',
};

export interface BadgeSignature {
  Args: {
    label?: string;
    color?: string;
    icon?: IconDefinition;
    isPill?: boolean;
    isLoading?: boolean;
  };
  Element: HTMLElement;
}

const Badge: TOC<BadgeSignature> = <template>
  <span
    class="text-xs font-medium px-2.5 py-0.5
      {{get colorVariants (or @color 'secondary')}}
      {{if @isPill 'rounded-full' 'rounded-sm'}}"
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
</template>;

export default Badge;
