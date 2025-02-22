import { modifier } from 'ember-modifier';
import {
  Calendar as FullCalendar,
  type EventClickArg,
} from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';

import type { TOC } from '@ember/component/template-only';

export interface Event {
  id?: string;
  title: string;
  start: Date;
  backgroundColor?: string;
}

const setup = modifier<{
  Element: HTMLElement;
  Args: {
    Positional: [Event[], ((event: Event, index: EventClickArg) => void)?];
  };
}>((element, [events, onSelect]) => {
  const calendar = new FullCalendar(element, {
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
      if (onSelect) {
        onSelect(arg.event as Event, arg);
      }
    },
  });

  calendar.render();
});

export interface CalendarSignature {
  Args: {
    events: Event[];
    onSelect?: (event: Event, index: EventClickArg) => void;
  };
  Element: HTMLDivElement;
}

const Calendar: TOC<CalendarSignature> = <template>
  <div data-test-calendar {{setup @events @onSelect}} ...attributes></div>
</template>;

export default Calendar;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Calendar: typeof Calendar;
  }
}
