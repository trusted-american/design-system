import Component from '@glimmer/component';

export interface HeadingComponentSignature {
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

export default class HeadingComponent extends Component<HeadingComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Heading: typeof HeadingComponent;
  }
}
