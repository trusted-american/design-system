import Component from '@glimmer/component';

export interface SubheadingSignature {
  Element: HTMLElement;
  Args: {
    title: string;
  };
  Blocks: {
    default: [];
  };
}

export default class Subheading extends Component<SubheadingSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Subheading: typeof Subheading;
  }
}
