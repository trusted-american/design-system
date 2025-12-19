import type { TOC } from '@ember/component/template-only';

export interface AccordionBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

<template>
  <div class="accordion-body" ...attributes>
    {{yield}}
  </div>
</template> satisfies TOC<AccordionBodySignature>;
