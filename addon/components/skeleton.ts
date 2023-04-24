import Component from '@glimmer/component';

export interface SkeletonComponentSignature {
  Element: HTMLElement;
}

export default class SkeletonComponent extends Component<SkeletonComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Skeleton: typeof SkeletonComponent;
  }
}
