import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { Button, Heading, Toast } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface ComponentsToastSignature {
  Args: {};
}

export default class ComponentsToast extends Component<ComponentsToastSignature> {
  close = () => {
    //
  };
}

<template>
  {{pageTitle "Toast"}}
  {{breadcrumb "Toast" route="components.toast"}}

  <Heading @title="Toast" />

  <Snippet @name="toast.gts">
    {{! BEGIN-SNIPPET toast }}
    <Toast @closeButtonLabel="Close">
      <:body>Body</:body>
    </Toast>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="toast1.gts">
    {{! BEGIN-SNIPPET toast1 }}
    <Toast @closeButtonLabel="Close">
      <:title>Title</:title>
      <:body>Body</:body>
    </Toast>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="toast2.gts">
    {{! BEGIN-SNIPPET toast2 }}
    <Toast @closeButtonLabel="Close" @onClose={{this.close}}>
      <:title>Title</:title>
      <:body>Body</:body>
    </Toast>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="toast3.gts">
    {{! BEGIN-SNIPPET toast3 }}
    <Toast
      @closeButtonLabel="Close"
      @color="primary"
      @onClose={{this.close}}
    >
      <:title>Title</:title>
      <:body>Body</:body>
    </Toast>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="toast4.gts">
    {{! BEGIN-SNIPPET toast4 }}
    <Toast
      @closeButtonLabel="Close"
      @color="success"
      @onClose={{this.close}}
    >
      <:title>Title</:title>
      <:body>Body</:body>
    </Toast>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="toast5.gts">
    {{! BEGIN-SNIPPET toast5 }}
    <Toast
      @closeButtonLabel="Close"
      @color="warning"
      @onClose={{this.close}}
    >
      <:title>Title</:title>
      <:body>Body</:body>
    </Toast>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="toast6.gts">
    {{! BEGIN-SNIPPET toast6 }}
    <Toast
      @closeButtonLabel="Close"
      @color="danger"
      @onClose={{this.close}}
    >
      <:title>Title</:title>
      <:body>Body</:body>
    </Toast>
    {{! END-SNIPPET }}
  </Snippet>

  <Snippet @name="toast7.gts">
    {{! BEGIN-SNIPPET toast7 }}
    <Toast @closeButtonLabel="Close" @onClose={{this.close}}>
      <:title>Title</:title>
      <:body>Body</:body>
      <:buttons>
        <Button
          @label="Button"
          @size="sm"
          @color="light"
          {{on "click" this.close}}
        />
        <Button
          @label="Link text"
          @size="sm"
          @color="link"
          {{on "click" this.close}}
        />
      </:buttons>
    </Toast>
    {{! END-SNIPPET }}
  </Snippet>
  </template>
}
