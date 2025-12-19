import type { TOC } from '@ember/component/template-only';

export interface CardFooterSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

<template>
  <div class="card-footer" ...attributes>
    {{yield}}
  </div>
</template> satisfies TOC<CardFooterSignature>;
