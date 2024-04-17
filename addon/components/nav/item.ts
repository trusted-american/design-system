import Component from '@glimmer/component';

export interface NavItemSignature {
  Args: {
    text?: string;
    route?: string;
    model?: unknown;
    query?: Record<string, unknown>;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLAnchorElement;
}

export default class NavItem extends Component<NavItemSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Nav::Item': typeof NavItem;
  }
}
