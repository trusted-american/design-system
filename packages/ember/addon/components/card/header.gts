import type { TOC } from '@ember/component/template-only';

export interface CardHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

<template>
  <div class="card-header" ...attributes>
    {{yield}}
  </div>
</template> satisfies TOC<CardHeaderSignature>;
