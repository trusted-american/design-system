import Component from '@glimmer/component';

export interface HeadingSignature {
  Args: {
    title: string;
    subtitle?: string;
    type?: string;
    identifier?: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class Heading extends Component<HeadingSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Heading: typeof Heading;
  }
}
