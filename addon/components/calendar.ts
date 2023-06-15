import Component from '@glimmer/component';
import { action } from '@ember/object';
import { Calendar as FullCalendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

interface Event {
  title: string;
  start: Date;
}

interface CalendarSignature {
  Args: {
    events: Event[];
  };
}

export default class Calendar extends Component<CalendarSignature> {
  calendar?: FullCalendar;

  @action
  didInsert(element: HTMLElement): void {
    const { events } = this.args;

    this.calendar = new FullCalendar(element, {
      plugins: [dayGridPlugin],
      initialView: 'dayGridMonth',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth',
      },
      events,
    });
    this.calendar.render();
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Calendar: typeof Calendar;
  }
}
