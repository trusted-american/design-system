import Route from '@ember/routing/route';

export default class CompsTableRoute extends Route {
  model() {
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';
    return [...alphabet].map((char) => ({
      email: `${char}@example.com`,
      firstName: char.toUpperCase(),
      lastName: char.toUpperCase(),
    }));
  }
}
