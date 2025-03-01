import { LinkTo } from '@ember/routing';
import { and } from 'ember-truth-helpers';

import type { TOC } from '@ember/component/template-only';
import type { LinkToArgs } from '../button';

export interface AlertLinkToSignature {
  Args: LinkToArgs;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

const AlertLinkTo: TOC<AlertLinkToSignature> = <template>
  {{#if (and @route @model)}}
    <LinkTo
      @route={{@route}}
      @model={{@model}}
      class="alert-link"
      ...attributes
    >{{yield}}</LinkTo>
  {{else if @route}}
    <LinkTo
      @route={{@route}}
      class="alert-link"
      ...attributes
    >{{yield}}</LinkTo>
  {{/if}}
</template>;

export default AlertLinkTo;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Alert::LinkTo': typeof AlertLinkTo;
  }
}
