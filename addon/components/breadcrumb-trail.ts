import Component from '@glimmer/component';

export default class BreadcrumbTrailComponent extends Component {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    BreadcrumbTrail: typeof BreadcrumbTrailComponent;
  }
}
