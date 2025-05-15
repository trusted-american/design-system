import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Heading, Link, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import {
  faHouse,
  faUpRightFromSquare,
} from '@fortawesome/free-solid-svg-icons';

export default RouteTemplate(
  <template>
    {{pageTitle "Link"}}
    {{breadcrumb "Link" route="components.link"}}

    <Heading @title="Link" />

    <Subheading @title="Internal" />

    <Snippet @name="link.gts">
      {{! BEGIN-SNIPPET link }}
      <Link @route="index" @icon={{faHouse}}>Home</Link>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="External" />

    <Snippet @name="link1.gts">
      {{! BEGIN-SNIPPET link1 }}
      <Link
        @href="https://www.google.com/"
        @icon={{faUpRightFromSquare}}
        @isIconTrailing={{true}}
      >Visit</Link>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
