import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import Button from './button';

export interface ButtonSetSignature {
  Blocks: {
    default: [{ button: typeof Button }];
  };
  Element: HTMLDivElement;
}

<template>
  <div class="btn-toolbar gap-2" data-test-button-set ...attributes>
    {{yield (hash button=Button)}}
  </div>
</template> satisfies TOC<ButtonSetSignature>;
