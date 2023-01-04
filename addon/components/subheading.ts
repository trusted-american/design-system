import Component from '@glimmer/component';

export interface SubheadingComponentSignature {
  Element: HTMLElement;
  Args: {
    title: string;
  };
  Blocks: {
    default: [];
  };
}

export default class SubheadingComponent extends Component<SubheadingComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Subheading: typeof SubheadingComponent;
  }
}
