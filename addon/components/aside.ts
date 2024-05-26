import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';

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
  @tracked collapsed = false;
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Aside: typeof Aside;
  }
}
