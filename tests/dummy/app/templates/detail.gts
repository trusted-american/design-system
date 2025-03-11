import RouteTemplate from 'ember-route-template';
import {
  Alert,
  Button,
  Card,
  Heading,
  MainBody,
  MainHeader,
  Nav,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

export default RouteTemplate(
  <template>
    {{pageTitle "Detail"}}
    {{breadcrumb "Detail" route="detail"}}

    <MainHeader>
      <Alert @icon="box-archive">
        Test
      </Alert>

      <Alert @color="warning" @icon="circle-exclamation">
        Test
      </Alert>

      <Heading
        @title="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
        @type="Type"
        @identifier="1234567890"
      >
        <Button
          @label="Actions"
          @icon="angle-down"
          @isIconTrailing={{true}}
          @color="primary"
        />
      </Heading>

      <Nav as |nav|>
        <nav.item @route="detail" @label="First" />
        <nav.item @route="index" @label="Second" />
        <nav.item @route="index" @label="Third" />
        <nav.item @route="index" @label="Fourth" />
        <nav.item @route="index" @label="Fifth" />
        <nav.item @route="index" @label="Sixth" />
        <nav.item @route="index" @label="Seventh" />
        <nav.item @route="index" @label="Eighth" />
      </Nav>
    </MainHeader>

    <MainBody>
      <Card as |card|>
        <card.body>
          Body
        </card.body>
      </Card>
    </MainBody>
  </template>,
);
