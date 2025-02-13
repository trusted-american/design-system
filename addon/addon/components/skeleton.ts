import Component from '@glimmer/component';

export interface SkeletonSignature {
  Element: HTMLElement;
}

export default class Skeleton extends Component<SkeletonSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Skeleton: typeof Skeleton;
  }
}
