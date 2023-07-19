import Route from '@ember/routing/route';
import { service } from '@ember/service';

import type RouterService from '@ember/routing/router-service';

export default class ComponentsIndexRoute extends Route {
  @service declare router: RouterService;

  beforeModel() {
    void this.router.transitionTo('components.alert');
  }
}
