import Component from '@glimmer/component';

export interface SkeletonSignature {
  Element: HTMLElement;
}

export default class Skeleton extends Component<SkeletonSignature> {
  <template>
    <span class="placeholder-glow">
      <span class="placeholder" data-test-skeleton ...attributes></span>
    </span>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Skeleton: typeof Skeleton;
  }
}
