import Component from '@glimmer/component';

export interface BannerSignature {
  Args: {
    color: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class Banner extends Component<BannerSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Banner: typeof Banner;
  }
}
