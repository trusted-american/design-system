import Route from '@ember/routing/route';

export default class ListRoute extends Route {
  model() {
    return new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve();
      }, 500);
    });
  }
}
