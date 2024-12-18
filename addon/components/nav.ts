import Component from '@glimmer/component';

export interface NavSignature {
  Args: {
    isPills?: boolean;
    isVertical?: boolean;
  };
  Blocks: {
    default: [];
    footer: [];
  };
  Element: HTMLElement;
}

export default class Nav extends Component<NavSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Nav: typeof Nav;
  }
}
