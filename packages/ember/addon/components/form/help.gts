import type { TOC } from '@ember/component/template-only';

export interface FormHelpSignature {
  Args: {
    label: string;
  };
  Element: HTMLDivElement;
}

<template>
  <div class="form-text" data-test-form-help ...attributes>
    {{@label}}
  </div>
</template> satisfies TOC<FormHelpSignature>;
