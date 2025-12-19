import type { TOC } from '@ember/component/template-only';

export interface FrameSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

<template>
  <div class="tds-frame d-grid vh-100 bg-body-tertiary" ...attributes>
    {{yield}}
  </div>
</template> satisfies TOC<FrameSignature>;
