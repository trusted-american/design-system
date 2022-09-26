import Route from '@ember/routing/route';
import { dasherize } from '@ember/string';

/**
 *
 * @param routeName
 * @returns
 */
function toClassName(routeName) {
  return `route.${dasherize(routeName)}`.replaceAll('.', '-');
}

/**
 * This initializer function automatically adds CSS classes to the body element that correlate to
 * the current route. This way, styles can be scoped by route.
 */
export function initialize(application) {
  Route.reopen({
    activate() {
      const rootElement = document.querySelector(application.rootElement);
      if (rootElement) {
        rootElement.classList.add(toClassName(this.routeName));
      }
    },
    deactivate() {
      const rootElement = document.querySelector(application.rootElement);
      if (rootElement) {
        rootElement.classList.remove(toClassName(this.routeName));
      }
    },
  });
}

export default {
  initialize,
};
