import Component from '@glimmer/component';

export interface NavItemInternalSignature {
  Args: {
    text?: string;
    icon?: string;
    count?: number;
    trailingIcon?: string;
  };
  Blocks: {
    default: [];
  };
}

export default class NavItemInternal extends Component<NavItemInternalSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Nav::Item::Internal': typeof NavItemInternal;
  }
}
