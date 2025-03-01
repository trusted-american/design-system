import Route from '@ember/routing/route';

import type { Event } from '@trusted-american/design-system/components/calendar';

export default class ComponentsCalendarRoute extends Route {
  model(): Event[] {
    return [
      { title: 'Event 1', start: new Date() },
      { title: 'Event 2', start: new Date(), backgroundColor: '#5af542' },
    ];
  }
}
