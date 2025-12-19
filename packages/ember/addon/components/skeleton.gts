import type { TOC } from '@ember/component/template-only';

export interface SkeletonSignature {
  Element: HTMLElement;
}

<template>
  <span class="placeholder-glow">
    <span class="placeholder" data-test-skeleton ...attributes></span>
  </span>
</template> satisfies TOC<SkeletonSignature>;
