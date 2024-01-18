import Controller from '@ember/controller';

import type { Event } from '@trusted-american/design-system/components/calendar';

export default class CompsCalendarController extends Controller {
  declare model: Event[];

  event?: Event;
}
