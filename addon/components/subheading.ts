import Component from '@glimmer/component';

export interface SubheadingSignature {
  Args: {
    title: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class Subheading extends Component<SubheadingSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Subheading: typeof Subheading;
  }
}
