import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { Button, Heading, Modal } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type CompsModalController from '../../controllers/comps/modal';

export default RouteTemplate<{
  Args: {
    controller: CompsModalController;
  };
}>(
  <template>
    {{pageTitle "Modal"}}
    {{breadcrumb "Modal" route="comps.modal"}}

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
          <p>Body</p>
          <Button @label="Close" {{on "click" onClose}} />
        </Modal>
      {{/if}}
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
) as TemplateFactory;
