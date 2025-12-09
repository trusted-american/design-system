import '@glint/environment-ember-loose';

declare global {
  /**
   * Get the resolved model value from a route.
   */
  type ModelFrom<R extends Route> = Awaited<ReturnType<R['model']>>;
}

declare module 'bootstrap' {
  export interface Offcanvas {
    _initializeFocusTrap(): {
      activate: () => void;
      deactivate: () => void;
    };
  }
}
