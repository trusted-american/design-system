import Controller from '@ember/controller';
import type { Event } from '@trusted-american/design-system/components/calendar';

export default class ComponentsCalendarController extends Controller {
  declare model: Event[];

  event?: Event;

  close = () => {
    this.event = undefined;
  };
}
