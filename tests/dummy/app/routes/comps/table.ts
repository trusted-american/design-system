import Route from '@ember/routing/route';

export interface User {
  email: string;
  firstName: string;
  lastName: string;
}

export default class CompsTableRoute extends Route {
  model(): User[] {
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';
    return [...alphabet].map((char) => ({
      email: `${char}@example.com`,
      firstName: char.toUpperCase(),
      lastName: char.toUpperCase(),
    }));
  }
}
