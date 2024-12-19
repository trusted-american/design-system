import Component from '@glimmer/component';

export interface RatioSignature {
  Args: {
    ratio?: '1x1' | '4x3' | '16x9' | '21x9';
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class Ratio extends Component<RatioSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Ratio: typeof Ratio;
  }
}
