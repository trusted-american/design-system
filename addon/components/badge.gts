import Icon from './icon';
import Spinner from './spinner';
import type { TOC } from '@ember/component/template-only';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { eq } from 'ember-truth-helpers';

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
    class="text-xs font-medium me-2 px-2.5 py-0.5
      {{if
        (eq 'primary' @color)
        'bg-blue-100 text-blue-800'
        (if
          (eq 'success' @color)
          'bg-green-100 text-green-800'
          (if
            (eq 'danger' @color)
            'bg-red-100 text-red-800'
            (if
              (eq 'warning' @color)
              'bg-yellow-100 text-yellow-800'
              (if
                (eq 'info' @color)
                'bg-purple-100 text-purple-800'
                'bg-gray-100 text-gray-800'
              )
            )
          )
        )
      }}
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
