import type { TOC } from '@ember/component/template-only';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import {
  Button,
  FormPowerSelect,
  Heading,
  Modal,
} from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';
import type ComponentsModalController from '../../controllers/components/modal';

interface ComponentsModalSignature {
  Args: {
    controller: ComponentsModalController;
  };
}

<template>
  {{pageTitle "Modal"}}
  {{breadcrumb "Modal" route="components.modal"}}

  <Heading @title="Modal" />

  <Snippet @name="modal.gts">
    {{! BEGIN-SNIPPET modal }}
    <Button
      @label="Open modal"
      {{on "click" (fn (mut @controller.showModal) true)}}
    />

    {{#if @controller.showModal}}
      <Modal
        @title="Title"
        @closeButtonLabel="Close"
        @onClose={{@controller.close}}
        as |onClose|
      >
        <p>
          Lorem Ipsum Generator 5 Paragraphs Copy Lorem ipsum dolor sit amet
          consectetur adipiscing elit. Quisque faucibus ex sapien vitae
          pellentesque sem placerat. In id cursus mi pretium tellus duis
          convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus
          fringilla lacus nec metus bibendum egestas. Iaculis massa nisl
          malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class
          aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos
          himenaeos.
        </p>

        <p><Button @label="Close" {{on "click" onClose}} /></p>

        <FormPowerSelect
          @options={{@controller.options}}
          @selected={{@controller.selected}}
          @searchField="name"
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @chooseLabel="Choose…"
          @searchLabel="Search…"
          @onChange={{fn (mut @controller.selected)}}
          class="mb-3"
          as |user|
        >
          {{user.name}}
        </FormPowerSelect>

        <p>
          Lorem Ipsum Generator 5 Paragraphs Copy Lorem ipsum dolor sit amet
          consectetur adipiscing elit. Quisque faucibus ex sapien vitae
          pellentesque sem placerat. In id cursus mi pretium tellus duis
          convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus
          fringilla lacus nec metus bibendum egestas. Iaculis massa nisl
          malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class
          aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos
          himenaeos.
        </p>
      </Modal>
    {{/if}}
    {{! END-SNIPPET }}
  </Snippet>
</template> satisfies TOC<ComponentsModalSignature>;
