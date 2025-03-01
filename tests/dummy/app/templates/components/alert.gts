import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Alert, Heading, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type ComponentsAlertController from '../../controllers/components/alert';

export default RouteTemplate<{
  Args: {
    controller: ComponentsAlertController;
  };
}>(
  <template>
    {{pageTitle "Alert"}}
    {{breadcrumb "Alert" route="components.alert"}}

    <Heading
      @title="Alert"
      @subtitle="Provide contextual feedback messages for typical user actions with the handful of available and flexible alert messages."
    />

    <Subheading @title="Examples" />

    <Snippet @name="alert1.gts">
      {{! BEGIN-SNIPPET alert1 }}
      <Alert @color="danger" @icon="triangle-exclamation">
        One of your domains is unverified. Please verify your domain to prevent
        others from claiming it.
        <a href="#" class="alert-link">Learn more</a>
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert2.gts">
      {{! BEGIN-SNIPPET alert2 }}
      <Alert
        @color="warning"
        @icon="circle-exclamation"
        @closeButtonLabel="Close"
        @onClose={{@controller.close}}
      >
        <a href="#" class="alert-link">Prebuilds</a>
        consume storage space that will incur a billable charge.
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert3.gts">
      {{! BEGIN-SNIPPET alert3 }}
      <Alert
        @color="success"
        @icon="check"
        @closeButtonLabel="Close"
        @onClose={{@controller.close}}
      >
        Payment information added successfully. Change it any time in
        <a href="#" class="alert-link">your profile</a>.
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert4.gts">
      {{! BEGIN-SNIPPET alert4 }}
      <Alert
        @color="info"
        @icon="circle-info"
        @closeButtonLabel="Close"
        @onClose={{@controller.close}}
      >
        Ignoring revisions in
        <a href="#" class="alert-link">.git-blame-ignore-revs</a>.
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert5.gts">
      {{! BEGIN-SNIPPET alert5 }}
      <Alert>
        Body here
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert6.gts">
      {{! BEGIN-SNIPPET alert6 }}
      <Alert>
        <:title>Title here</:title>
        <:default>Body here</:default>
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert7.gts">
      {{! BEGIN-SNIPPET alert7 }}
      <Alert @color="success">
        <:title>Title here</:title>
        <:default>Body here</:default>
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert8.gts">
      {{! BEGIN-SNIPPET alert8 }}
      <Alert @color="success" @icon="info-circle">
        <:title>Title here</:title>
        <:default>Body here</:default>
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert9.gts">
      {{! BEGIN-SNIPPET alert9 }}
      <Alert
        @color="success"
        @icon="info-circle"
        @closeButtonLabel="Close"
        @onClose={{@controller.close}}
      >
        <:title>Title here</:title>
        <:default>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo consequat. Duis aute irure dolor in
          reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
          pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
          culpa qui officia deserunt mollit anim id est laborum.
        </:default>
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
