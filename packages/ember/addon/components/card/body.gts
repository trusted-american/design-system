import type { TOC } from '@ember/component/template-only';

export interface CardBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

<template>
  <div class="card-body" ...attributes>
    {{yield}}
  </div>
</template> satisfies TOC<CardBodySignature>;
