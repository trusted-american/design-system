import Link, { type LinkToArgs } from '../link';

import type { TOC } from '@ember/component/template-only';

export interface AlertLinkToSignature {
  Args: LinkToArgs;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

const AlertLinkTo: TOC<AlertLinkToSignature> = <template>
  <Link
    @route={{@route}}
    @model={{@model}}
    @query={{@query}}
    class="alert-link"
    ...attributes
  >{{yield}}</Link>
</template>;

export default AlertLinkTo;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Alert::LinkTo': typeof AlertLinkTo;
  }
}
