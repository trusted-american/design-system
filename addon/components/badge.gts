import Icon from './icon';
import SpinnerInternal from './spinner/internal';

import type { TOC } from '@ember/component/template-only';

export interface BadgeSignature {
  Args: {
    label?: string;
    color?: string;
    icon?: string;
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
      <SpinnerInternal />
    {{/if}}
    {{#if @icon}}
      <Icon @icon={{@icon}} class={{if @label "me-1"}} />
    {{/if}}
    {{@label}}
  </span>
</template>;

export default Badge;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Badge: typeof Badge;
  }
}
