import type { TOC } from '@ember/component/template-only';
import { concat, hash } from '@ember/helper';
import type { Size } from '@trusted-american/core';
import Button from './button';

export interface ButtonGroupSignature {
  Args: {
    size?: Size;
  };
  Blocks: {
    default: [{ button: typeof Button }];
  };
  Element: HTMLDivElement;
}

<template>
  <div
    class="btn-group {{if @size (concat 'btn-group-' @size)}}"
    role="group"
    data-test-button-group
    ...attributes
  >
    {{yield (hash button=Button)}}
  </div>
</template> satisfies TOC<ButtonGroupSignature>;
