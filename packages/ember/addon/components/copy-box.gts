import type { TOC } from '@ember/component/template-only';

export interface CopyBoxSignature {
  Args: {
    value: string;
  };
  Element: HTMLDivElement;
}

<template>
  <div data-test-copy-box ...attributes>
    {{! TODO: }}
  </div>
</template> satisfies TOC<CopyBoxSignature>;
