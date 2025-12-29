import type { TOC } from '@ember/component/template-only';
import type { Color } from '@trusted-american/core';

export interface BannerSignature {
  Args: {
    color?: Color;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

<template>
  <section
    class="text-bg-{{if @color @color 'secondary'}} text-center fw-semibold p-2"
    data-test-banner
    ...attributes
  >
    {{yield}}
  </section>
</template> satisfies TOC<BannerSignature>;
