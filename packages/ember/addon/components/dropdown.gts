import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import DropdownDivider from './dropdown/divider';
import DropdownItem from './dropdown/item';

export interface DropdownSignature {
  Blocks: {
    default: [{ item: typeof DropdownItem; divider: typeof DropdownDivider }];
  };
  Element: HTMLDivElement;
}

<template>
  <div class="dropdown-menu dropdown-menu-end" data-test-dropdown ...attributes>
    {{yield (hash item=DropdownItem divider=DropdownDivider)}}
  </div>
</template> satisfies TOC<DropdownSignature>;
