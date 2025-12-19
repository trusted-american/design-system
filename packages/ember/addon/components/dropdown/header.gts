import type { TOC } from '@ember/component/template-only';

export interface DropdownHeaderSignature {
  Args: {
    label: string;
  };
  Element: HTMLHeadingElement;
}

<template>
  <h6 class="dropdown-header" ...attributes>{{@label}}</h6>
</template> satisfies TOC<DropdownHeaderSignature>;
