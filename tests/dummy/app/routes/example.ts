import Route from '@ember/routing/route';

export default class ExampleRoute extends Route {
  model() {
    return new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve();
      }, 500);
    });
  }
}
