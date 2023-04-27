import Route from '@ember/routing/route';
import { dasherize } from '@ember/string';

import type Application from '@ember/application';

/**
 *
 * @param routeName
 * @returns
 */
function toClassName(routeName: string) {
  return `route.${dasherize(routeName)}`.replaceAll('.', '-');
}

/**
 * This initializer function automatically adds CSS classes to the body element that correlate to
 * the current route. This way, styles can be scoped by route.
 */
export function initialize(application: Application) {
  Route.reopen({
    activate() {
      const rootElement = document.querySelector(
        application.rootElement as string
      );
      if (rootElement) {
        rootElement.classList.add(
          toClassName((this as unknown as Route).routeName)
        );
      }
    },
    deactivate() {
      const rootElement = document.querySelector(
        application.rootElement as string
      );
      if (rootElement) {
        rootElement.classList.remove(
          toClassName((this as unknown as Route).routeName)
        );
      }
    },
  });
}

export default {
  initialize,
};
