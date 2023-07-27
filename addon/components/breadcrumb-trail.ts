import Component from '@glimmer/component';

export default class BreadcrumbTrail extends Component {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    BreadcrumbTrail: typeof BreadcrumbTrail;
  }
}
