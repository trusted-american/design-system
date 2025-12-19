import type { TOC } from '@ember/component/template-only';

export interface MainFooterSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

<template>
  <footer
    class="container-fluid text-center text-secondary border-top p-4"
    data-test-main-footer
    ...attributes
  >
    {{yield}}
  </footer>
</template> satisfies TOC<MainFooterSignature>;
