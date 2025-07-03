import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import {
  Badge,
  Heading,
  Nav,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import { faHouse } from '@fortawesome/free-solid-svg-icons';

export default RouteTemplate(
  <template>
    {{pageTitle "Nav"}}
    {{breadcrumb "Nav" route="components.nav"}}

    <Heading @title="Nav" />

    <Subheading @title="Tabs" />

    <Snippet @name="nav.gts">
      {{! BEGIN-SNIPPET nav }}
      <Nav as |nav|>
        <nav.item @route="components" @label="First" />
        <nav.item @route="index" @label="Second" @icon={{faHouse}} />
        <nav.item @route="index" @label="Third" @count={{12}} />
        <nav.item @route="index" @label="Fourth">
          <Badge @label="New" />
        </nav.item>
      </Nav>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Pills" />

    <Snippet @name="nav1.gts">
      {{! BEGIN-SNIPPET nav1 }}
      <Nav @isPills={{true}} as |nav|>
        <nav.item @route="components" @label="First" />
        <nav.item @route="index" @label="Second" @icon={{faHouse}} />
        <nav.item @route="index" @label="Third" @count={{12}} />
        <nav.item @route="index" @label="Fourth">
          <Badge @label="New" />
        </nav.item>
      </Nav>
      <hr />
      <Nav @isPills={{true}} @isFill={{true}} as |nav|>
        <nav.item @route="components" @label="First" />
        <nav.item @route="index" @label="Second" @icon={{faHouse}} />
        <nav.item @route="index" @label="Third" @count={{12}} />
        <nav.item @route="index" @label="Fourth">
          <Badge @label="New" />
        </nav.item>
      </Nav>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Vertical" />

    <Snippet @name="nav2.gts">
      {{! BEGIN-SNIPPET nav2 }}
      <Nav @isPills={{true}} @isVertical={{true}} as |nav|>
        <nav.item @route="components" @label="First" />
        <nav.item @route="index" @label="Second" @icon={{faHouse}} />
        <nav.item @route="index" @label="Third" @count={{12}} />
        <nav.item @route="index" @label="Fourth">
          <Badge @label="New" />
        </nav.item>
      </Nav>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
