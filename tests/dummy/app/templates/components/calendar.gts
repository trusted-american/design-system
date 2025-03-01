import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { fn } from '@ember/helper';
import { Calendar, Heading, Modal } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';
import type ComponentsCalendarController from '../../controllers/components/calendar';

export default RouteTemplate<{
  Args: {
    controller: ComponentsCalendarController;
  };
}>(
  <template>
    {{pageTitle "Calendar"}}
    {{breadcrumb "Calendar" route="components.calendar"}}

    <Heading @title="Calendar" />

    <Snippet @name="calendar.gts">
      {{! BEGIN-SNIPPET calendar }}
      <Calendar
        @events={{@controller.model}}
        @onSelect={{fn (mut @controller.event)}}
      />
      {{! END-SNIPPET }}
    </Snippet>

    {{#if @controller.event}}
      <Modal
        @title="Event"
        @closeButtonLabel="Close"
        @onClose={{@controller.close}}
      >
        {{@controller.event.title}}
      </Modal>
    {{/if}}
  </template>,
) as TemplateFactory;
