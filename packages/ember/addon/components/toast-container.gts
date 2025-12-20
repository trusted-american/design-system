import type { TOC } from '@ember/component/template-only';

export interface ToastContainerSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

<template>
  <div class="toast-container position-fixed bottom-0 end-0 p-3">
    {{yield}}
  </div>
</template> satisfies TOC<ToastContainerSignature>;
