import type { TOC } from '@ember/component/template-only';

export interface SkeletonSignature {
  Element: HTMLElement;
}

const Skeleton: TOC<SkeletonSignature> = <template>
  <div role="status" class="max-w-sm animate-pulse">
    <div
      class="h-2.5 bg-gray-200 rounded-full w-48"
      data-test-skeleton
      ...attributes
    ></div>
    {{! TODO: string }}
    <span class="sr-only">Loading…</span>
  </div>
</template>;

export default Skeleton;
