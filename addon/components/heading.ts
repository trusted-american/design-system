import Component from '@glimmer/component';

export interface HeadingSignature {
  Element: HTMLDivElement;
  Args: {
    title: string;
    subtitle?: string;
    type?: string;
    code?: string;
  };
  Blocks: {
    default: [];
  };
}

export default class Heading extends Component<HeadingSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Heading: typeof Heading;
  }
}
