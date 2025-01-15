import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export interface AsideSignature {
  Args: {
    title: string;
    logo: string;
    route: string;
  };
  Blocks: {
    header: [];
    default: [];
    footerNav: [];
    footer: [];
  };
}

export default class Aside extends Component<AsideSignature> {
  @tracked isCollapsed = false;

  @action setTrue() {
    this.isCollapsed = true;
  }

  @action setFalse() {
    this.isCollapsed = false;
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Aside: typeof Aside;
  }
}
