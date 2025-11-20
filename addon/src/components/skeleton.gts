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
