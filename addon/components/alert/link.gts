import Link, { type LinkSignature } from '../link';
import type { TOC } from '@ember/component/template-only';

const AlertLink: TOC<LinkSignature> = <template>
  <Link
    @route={{@route}}
    @model={{@model}}
    @query={{@query}}
    @href={{@href}}
    @isLocalHref={{@isLocalHref}}
    @label={{@label}}
    @icon={{@icon}}
    @iconPrefix={{@iconPrefix}}
    @isIconTrailing={{@isIconTrailing}}
    @isIconOnly={{@isIconOnly}}
    class="alert-link"
    data-test-alert-link
    ...attributes
  >{{yield}}</Link>
</template>;

export default AlertLink;
