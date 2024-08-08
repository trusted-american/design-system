import Component from '@glimmer/component';
import { action } from '@ember/object';
import {
  Calendar as FullCalendar,
  type EventClickArg,
} from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';

export interface Event {
  id?: string;
  title: string;
  start: Date;
  backgroundColor?: string;
}

export interface CalendarSignature {
  Args: {
    events: Event[];
    onSelect?: (event: Event, index: EventClickArg) => void;
  };
  Element: HTMLDivElement;
}

export default class Calendar extends Component<CalendarSignature> {
  calendar?: FullCalendar;

  @action
  didInsert(element: HTMLElement): void {
    const { events } = this.args;

    this.calendar = new FullCalendar(element, {
      plugins: [dayGridPlugin, timeGridPlugin, listPlugin],
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',
      },
      buttonText: {
        today: 'Today',
        month: 'Month',
        week: 'Week',
        day: 'Day',
        list: 'List',
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
