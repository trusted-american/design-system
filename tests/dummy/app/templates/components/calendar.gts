import { fn } from '@ember/helper';
import Component from '@glimmer/component';
import type { Event } from '@trusted-american/design-system/components/calendar';
import { Calendar, Heading, Modal } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import Snippet from '../../components/snippet';

interface ComponentsCalendarSignature {
  Args: {
    model: Event[];
  };
}

export default class ComponentsCalendar extends Component<ComponentsCalendarSignature> {
  event?: Event;

  close = () => {
    this.event = undefined;
  };

  <template>
    {{pageTitle "Calendar"}}
    {{breadcrumb "Calendar" route="components.calendar"}}

    <Heading @title="Calendar" />

    <Snippet @name="calendar.gts">
      {{! BEGIN-SNIPPET calendar }}
      <Calendar @events={{@model}} @onSelect={{fn (mut this.event)}} />
      {{! END-SNIPPET }}
    </Snippet>

    {{#if this.event}}
      <Modal @title="Event" @closeButtonLabel="Close" @onClose={{this.close}}>
        {{this.event.title}}
      </Modal>
    {{/if}}
  </template>
}
