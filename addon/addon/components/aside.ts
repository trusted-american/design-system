import Component from '@glimmer/component';

export interface AsideSignature {
  Args: {
    title: string;
    logo: string;
    route: string;
    isCollapsed: boolean;
    onChange: (isCollapsed: boolean) => void;
  };
  Blocks: {
    header: [];
    default: [];
    footerNav: [];
    footer: [];
  };
}

export default class Aside extends Component<AsideSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Aside: typeof Aside;
  }
}
