import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import Icon from './icon';
import Spinner from './spinner';

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
</template>;

export default Badge;
