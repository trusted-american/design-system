import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
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

interface ComponentsModalSignature {
  Args: {};
}

export default class ComponentsModal extends Component<ComponentsModalSignature> {
  @tracked showModal = false;

  options = [
    { name: 'Alice' },
    { name: 'Bob' },
    { name: 'Charlie' },
    { name: 'Diana' },
    { name: 'Eve' },
    { name: 'Frank' },
    { name: 'Grace' },
    { name: 'Heidi' },
    { name: 'Ivan' },
    { name: 'Judy' },
    { name: 'Kevin' },
    { name: 'Lauren' },
    { name: 'Mallory' },
    { name: 'Niaj' },
    { name: 'Olivia' },
    { name: 'Peggy' },
  ];
  selected?: { name: string };

  close = () => {
    this.showModal = false;
  };

  <template>
    {{pageTitle "Modal"}}
    {{breadcrumb "Modal" route="components.modal"}}

    <Heading @title="Modal" />

    <Snippet @name="modal.gts">
      {{! BEGIN-SNIPPET modal }}
      <Button
        @label="Open modal"
        {{on "click" (fn (mut this.showModal) true)}}
      />

      {{#if this.showModal}}
        <Modal
          @title="Title"
          @closeButtonLabel="Close"
          @onClose={{this.close}}
          as |onClose|
        >
          <p>
            Lorem Ipsum Generator 5 Paragraphs Copy Lorem ipsum dolor sit amet
            consectetur adipiscing elit. Quisque faucibus ex sapien vitae
            pellentesque sem placerat. In id cursus mi pretium tellus duis
            convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar
            vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa
            nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel
            class aptent taciti sociosqu. Ad litora torquent per conubia nostra
            inceptos himenaeos.
          </p>

          <p><Button @label="Close" {{on "click" onClose}} /></p>

          <FormPowerSelect
            @options={{this.options}}
            @selected={{this.selected}}
            @searchField="name"
            @label="Label"
            @identifier="identifier"
            @requiredLabel="Required"
            @chooseLabel="Choose…"
            @searchLabel="Search…"
            @onChange={{fn (mut this.selected)}}
            class="mb-3"
            as |user|
          >
            {{user.name}}
          </FormPowerSelect>

          <p>
            Lorem Ipsum Generator 5 Paragraphs Copy Lorem ipsum dolor sit amet
            consectetur adipiscing elit. Quisque faucibus ex sapien vitae
            pellentesque sem placerat. In id cursus mi pretium tellus duis
            convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar
            vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa
            nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel
            class aptent taciti sociosqu. Ad litora torquent per conubia nostra
            inceptos himenaeos.
          </p>
        </Modal>
      {{/if}}
      {{! END-SNIPPET }}
    </Snippet>
  </template>
}
