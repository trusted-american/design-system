import type { TOC } from '@ember/component/template-only';

export interface DropdownDividerSignature {
  Element: HTMLHRElement;
}

<template>
  <hr class="dropdown-divider" data-test-dropdown-divider ...attributes />
</template> satisfies TOC<DropdownDividerSignature>;
