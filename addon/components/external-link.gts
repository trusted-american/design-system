import Icon from './icon';

import type { TOC } from '@ember/component/template-only';
import type { IconPrefix } from '@fortawesome/fontawesome-svg-core';

export interface ExternalLinkSignature {
  Args: {
    href: string;
    label?: string;
    icon?: string;
    iconPrefix?: IconPrefix;
    isIconTrailing?: boolean;
    isIconOnly?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

const ExternalLink: TOC<ExternalLinkSignature> = <template>
  <a
    href={{@href}}
    target="_blank"
    rel="noopener noreferrer"
    data-test-external-link
    ...attributes
  >
    {{#unless @isIconOnly}}
      {{#if @isIconTrailing}}
        {{#if @label}}{{@label}}{{else}}{{yield}}{{/if}}{{/if}}{{/unless}}
    {{#if @icon}}
      <Icon
        @icon={{@icon}}
        @prefix={{@iconPrefix}}
        class={{unless @isIconOnly (if @isIconTrailing "ms-1" "me-1")}}
      />
    {{/if}}
    {{#unless @isIconOnly}}
      {{#unless @isIconTrailing}}
        {{#if
          @label
        }}{{@label}}{{else}}{{yield}}{{/if}}{{/unless}}{{/unless}}</a>
</template>;

export default ExternalLink;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ExternalLink: typeof ExternalLink;
  }
}
