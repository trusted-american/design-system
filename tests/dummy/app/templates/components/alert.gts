import Component from '@glimmer/component';
import {
  faCheck,
  faCircleExclamation,
  faCircleInfo,
  faInfoCircle,
  faTriangleExclamation,
} from '@fortawesome/free-solid-svg-icons';
import { Alert, Heading, Subheading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface ComponentsAlertSignature {
  Args: {};
}

export default class ComponentsAlert extends Component<ComponentsAlertSignature> {
  close = () => {
    alert('Action');
  };

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
      <Alert @color="danger" @icon={{faTriangleExclamation}} as |alert|>
        One of your domains is unverified. Please verify your domain to prevent
        others from claiming it.
        <alert.link @route="index" @label="Learn more" />
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert1.gts">
      {{! BEGIN-SNIPPET alert1 }}
      <Alert
        @color="warning"
        @icon={{faCircleExclamation}}
        @closeButtonLabel="Close"
        @onClose={{this.close}}
        as |alert|
      >
        <alert.link @route="index" @label="Prebuilds" />
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
        @onClose={{this.close}}
        as |alert|
      >
        Payment information added successfully. Change it any time in
        <alert.link @route="index" @label="your profile" />.
      </Alert>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="alert3.gts">
      {{! BEGIN-SNIPPET alert3 }}
      <Alert
        @color="info"
        @icon={{faCircleInfo}}
        @closeButtonLabel="Close"
        @onClose={{this.close}}
        as |alert|
      >
        Ignoring revisions in
        <alert.link @route="index" @label=".git-blame-ignore-revs" />.
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
        @onClose={{this.close}}
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
  </template>
}
