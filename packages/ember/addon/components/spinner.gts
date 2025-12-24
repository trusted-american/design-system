import type { TOC } from '@ember/component/template-only';
import { concat } from '@ember/helper';
import type { Color } from '@trusted-american/core';

export interface SpinnerSignature {
  Args: {
    color?: Color | 'white';
    isLarge?: boolean;
    loadingLabel: string;
  };
  Element: HTMLDivElement;
}

<template>
  <div
    class="spinner-border
      {{unless @isLarge 'spinner-border-sm'}}
      {{if @color (concat 'text-' @color) 'text-secondary'}}"
    role="status"
    data-test-spinner
    ...attributes
  >
    <span class="visually-hidden">{{@loadingLabel}}</span>
  </div>
</template> satisfies TOC<SpinnerSignature>;
