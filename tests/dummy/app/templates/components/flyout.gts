import type { TOC } from '@ember/component/template-only';
import Snippet from '../../components/snippet';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { Button, Flyout, Heading } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import type ComponentsFlyoutController from '../../controllers/components/flyout';

interface ComponentsFlyoutSignature {
  Args: {
    controller: ComponentsFlyoutController;
  };
}

<template>
  {{pageTitle "Flyout"}}
  {{breadcrumb "Flyout" route="components.flyout"}}

  <Heading @title="Flyout" />

  <Snippet @name="flyout.gts">
    {{! BEGIN-SNIPPET flyout }}
    <Button
      @label="Open flyout"
      {{on "click" (fn (mut @controller.showFlyout) true)}}
    />

    {{#if @controller.showFlyout}}
      <Flyout
        @title="Title"
        @closeButtonLabel="Close"
        @onClose={{@controller.close}}
      >
        Body
      </Flyout>
    {{/if}}
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsFlyoutSignature>;
