import Route from '@ember/routing/route';
import { kebabCase } from 'change-case';

import type Application from '@ember/application';

/**
 *
 * @param routeName
 * @returns
 */
function toClassName(routeName: string) {
  return `route.${kebabCase(routeName)}`.replaceAll('.', '-');
}

/**
 * This initializer function automatically adds CSS classes to the body element that correlate to
 * the current route. This way, styles can be scoped by route.
 */
export function initialize(application: Application) {
  const rootElement = document.querySelector(application.rootElement as string);

  Route.reopen({
    activate(this: Route) {
      if (rootElement) {
        rootElement.classList.add(toClassName(this.routeName));
      }
    },
    deactivate(this: Route) {
      if (rootElement) {
        rootElement.classList.remove(toClassName(this.routeName));
      }
    },
  });
}

export default {
  initialize,
};
