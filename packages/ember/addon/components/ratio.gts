import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';

export interface RatioSignature {
  Args: {
    ratio?: '1x1' | '4x3' | '16x9' | '21x9';
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

<template>
  <div
    class="ratio {{if @ratio (concat 'ratio-' @ratio)}}"
    data-test-ratio
    ...attributes
  >
    {{yield}}
  </div>
</template> satisfies TOC<RatioSignature>;
