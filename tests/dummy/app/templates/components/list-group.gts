import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import {
  Heading,
  ListGroup,
  ListGroupItem,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "List group"}}
    {{breadcrumb "List group" route="components.list-group"}}

    <Heading @title="List group" />

    <Subheading @title="Default" />

    <Snippet @name="list-group.gts">
      {{! BEGIN-SNIPPET list-group }}
      <ListGroup>
        <ListGroupItem class="active">An active item</ListGroupItem>
        <ListGroupItem>A second item</ListGroupItem>
        <ListGroupItem @route="index">Route</ListGroupItem>
        <ListGroupItem @href="https://www.google.com/">Href</ListGroupItem>
      </ListGroup>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Disabled" />

    <Snippet @name="list-group1.gts">
      {{! BEGIN-SNIPPET list-group1 }}
      <ListGroup>
        <ListGroupItem class="disabled">A disabled item</ListGroupItem>
        <ListGroupItem>A second item</ListGroupItem>
      </ListGroup>
      {{! END-SNIPPET }}
    </Snippet>

    <Subheading @title="Flush" />

    <Snippet @name="list-group2.gts">
      {{! BEGIN-SNIPPET list-group2 }}
      <ListGroup @isFlush={{true}}>
        <ListGroupItem>An item</ListGroupItem>
      </ListGroup>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
