import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { Button, Heading, Subheading, Toast } from '@trusted-american/ember';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';
import type ComponentsToastRoute from '../../routes/components/toast';

interface ComponentsToastSignature {
  Args: {
    model: ModelFrom<ComponentsToastRoute>;
  };
}

export default class ComponentsToast extends Component<ComponentsToastSignature> {
  close = () => {
    //
  };

  <template>
    {{pageTitle "Toast"}}
    {{breadcrumb "Toast" route="components.toast"}}

    <Heading @title="Toast" />

    <Subheading @title="Examples" />

    {{! TODO: index }}
    <Snippet @name="toast8.gts">
      {{! BEGIN-SNIPPET toast8 }}
      <Toast @color="primary" @closeButtonLabel="Close">
        <:body>Primary</:body>
      </Toast>
      <Toast @closeButtonLabel="Close">
        <:body>Secondary</:body>
      </Toast>
      <Toast @color="success" @closeButtonLabel="Close">
        <:body>Success</:body>
      </Toast>
      <Toast @color="danger" @closeButtonLabel="Close">
        <:body>Danger</:body>
      </Toast>
      <Toast @color="warning" @closeButtonLabel="Close">
        <:body>Warning</:body>
      </Toast>
      <Toast @color="info" @closeButtonLabel="Close">
        <:body>Info</:body>
      </Toast>
      <Toast @color="upsell" @closeButtonLabel="Close">
        <:body>Upsell</:body>
      </Toast>
      {{! END-SNIPPET }}
    </Snippet>

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
      <Toast @color="primary" @closeButtonLabel="Close" @onClose={{this.close}}>
        <:title>Title</:title>
        <:body>Body</:body>
      </Toast>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="toast4.gts">
      {{! BEGIN-SNIPPET toast4 }}
      <Toast @color="success" @closeButtonLabel="Close" @onClose={{this.close}}>
        <:title>Title</:title>
        <:body>Body</:body>
      </Toast>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="toast5.gts">
      {{! BEGIN-SNIPPET toast5 }}
      <Toast @color="warning" @closeButtonLabel="Close" @onClose={{this.close}}>
        <:title>Title</:title>
        <:body>Body</:body>
      </Toast>
      {{! END-SNIPPET }}
    </Snippet>

    <Snippet @name="toast6.gts">
      {{! BEGIN-SNIPPET toast6 }}
      <Toast @color="danger" @closeButtonLabel="Close" @onClose={{this.close}}>
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
          <Button @label="Button" @size="sm" {{on "click" this.close}} />
          <Button @label="Link text" @size="sm" {{on "click" this.close}} />
        </:buttons>
      </Toast>
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
