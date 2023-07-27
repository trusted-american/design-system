import Route from '@ember/routing/route';

export default class CompsCalendarRoute extends Route {
  model() {
    return [
      { title: 'Event 1', start: new Date() },
      { title: 'Event 2', start: new Date(), backgroundColor: '#5af542' },
    ];
  }
}
