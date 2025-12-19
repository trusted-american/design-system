import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import ProgressBar from './progress/bar';

export interface ProgressSignature {
  Blocks: {
    default: [{ bar: typeof ProgressBar }];
  };
  Element: HTMLElement;
}

<template>
  <div class="progress" data-test-progress ...attributes>
    {{yield (hash bar=ProgressBar)}}
  </div>
</template> satisfies TOC<ProgressSignature>;
