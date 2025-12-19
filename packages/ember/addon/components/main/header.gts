import type { TOC } from '@ember/component/template-only';

export interface MainHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

<template>
  <header
    class="container-fluid bg-body-tertiary pt-4"
    data-test-main-header
    ...attributes
  >
    {{yield}}
  </header>
</template> satisfies TOC<MainHeaderSignature>;
