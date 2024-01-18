import Component from '@glimmer/component';
import { action } from '@ember/object';
import {
  Calendar as FullCalendar,
  type EventClickArg,
} from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

export interface Event {
  title: string;
  start: Date;
  backgroundColor?: string;
}

interface CalendarSignature {
  Args: {
    events: Event[];
    onSelect?: (event: Event, index: EventClickArg) => void;
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
      eventClick: (arg) => {
        if (this.args.onSelect) {
          this.args.onSelect(arg.event as Event, arg);
        }
      },
    });
    this.calendar.render();
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Calendar: typeof Calendar;
  }
}
