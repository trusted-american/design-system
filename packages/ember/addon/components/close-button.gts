import type { TOC } from '@ember/component/template-only';

export interface CloseButtonSignature {
  Args: {
    label: string;
  };
  Element: HTMLButtonElement;
}

<template>
  <button
    type="button"
    class="btn-close"
    aria-label={{@label}}
    data-test-close-button
    ...attributes
  ></button>
</template> satisfies TOC<CloseButtonSignature>;
