import Controller from '@ember/controller';
import { action } from '@ember/object';

import type { Event } from '@trusted-american/design-system/components/calendar';

export default class CompsCalendarController extends Controller {
  declare model: Event[];

  event?: Event;

  @action
  close(): void {
    this.event = undefined;
  }
}
