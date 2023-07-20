import Route from '@ember/routing/route';

export default class ComponentsTableRoute extends Route {
  model() {
    return [
      { email: 'a@example.com', firstName: 'A', lastName: 'A' },
      { email: 'b@example.com', firstName: 'B', lastName: 'B' },
      { email: 'c@example.com', firstName: 'C', lastName: 'C' },
    ];
  }
}
