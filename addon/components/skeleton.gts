import type { TOC } from '@ember/component/template-only';

export interface SkeletonSignature {
  Element: HTMLElement;
}

const Skeleton: TOC<SkeletonSignature> = <template>
  <span class="placeholder-glow">
    <span class="placeholder" data-test-skeleton ...attributes></span>
  </span>
</template>;

export default Skeleton;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Skeleton: typeof Skeleton;
  }
}
