import Link, { type LinkToArgs } from '../link';

import type { TOC } from '@ember/component/template-only';

export interface AlertLinkSignature {
  Args: LinkToArgs;
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

const AlertLink: TOC<AlertLinkSignature> = <template>
  <Link
    @route={{@route}}
    @model={{@model}}
    @query={{@query}}
    class="alert-link"
    data-test-alert-link
    ...attributes
  >{{yield}}</Link>
</template>;

export default AlertLink;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Alert::Link': typeof AlertLink;
  }
}
