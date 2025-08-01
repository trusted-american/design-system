import type { TOC } from '@ember/component/template-only';
import {
  faCheck,
  faCircleExclamation,
  faCircleInfo,
  faInfoCircle,
  faTriangleExclamation,
} from '@fortawesome/free-solid-svg-icons';
import {
  Alert,
  AlertLink,
  Heading,
  Subheading,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';
import type ComponentsAlertController from '../../controllers/components/alert';

interface ComponentsAlertSignature {
  Args: {
    controller: ComponentsAlertController;
  };
}

<template>
  {{pageTitle "Alert"}}
  {{breadcrumb "Alert" route="components.alert"}}

  <Heading
    @title="Alert"
    @subtitle="Provide contextual feedback messages for typical user actions with the handful of available and flexible alert messages."
  />

  <Subheading @title="Examples" />

  <Snippet @name="alert.gts">
    {{! BEGIN-SNIPPET alert }}
    <Alert @color="danger" @icon={{faTriangleExclamation}}>
      One of your domains is unverified. Please verify your domain to prevent
      others from claiming it.
      <AlertLink @route="index">Learn more</AlertLink>
    </Alert>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="alert1.gts">
    {{! BEGIN-SNIPPET alert1 }}
    <Alert
      @color="warning"
      @icon={{faCircleExclamation}}
      @closeButtonLabel="Close"
      @onClose={{@controller.close}}
    >
      <AlertLink @route="index">Prebuilds</AlertLink>
      consume storage space that will incur a billable charge.
    </Alert>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="alert2.gts">
    {{! BEGIN-SNIPPET alert2 }}
    <Alert
      @color="success"
      @icon={{faCheck}}
      @closeButtonLabel="Close"
      @onClose={{@controller.close}}
    >
      Payment information added successfully. Change it any time in
      <AlertLink @route="index">your profile</AlertLink>.
    </Alert>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="alert3.gts">
    {{! BEGIN-SNIPPET alert3 }}
    <Alert
      @color="info"
      @icon={{faCircleInfo}}
      @closeButtonLabel="Close"
      @onClose={{@controller.close}}
    >
      Ignoring revisions in
      <AlertLink @route="index">.git-blame-ignore-revs</AlertLink>.
    </Alert>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="alert4.gts">
    {{! BEGIN-SNIPPET alert4 }}
    <Alert>
      Body here
    </Alert>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="alert5.gts">
    {{! BEGIN-SNIPPET alert5 }}
    <Alert>
      <:title>Title here</:title>
      <:default>Body here</:default>
    </Alert>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="alert6.gts">
    {{! BEGIN-SNIPPET alert6 }}
    <Alert @color="success">
      <:title>Title here</:title>
      <:default>Body here</:default>
    </Alert>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="alert7.gts">
    {{! BEGIN-SNIPPET alert7 }}
    <Alert @color="success" @icon={{faInfoCircle}}>
      <:title>Title here</:title>
      <:default>Body here</:default>
    </Alert>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="alert8.gts">
    {{! BEGIN-SNIPPET alert8 }}
    <Alert
      @color="success"
      @icon={{faInfoCircle}}
      @closeButtonLabel="Close"
      @onClose={{@controller.close}}
    >
      <:title>Title here</:title>
      <:default>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
        veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
        commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
        velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia deserunt
        mollit anim id est laborum.
      </:default>
    </Alert>
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsAlertSignature>;
