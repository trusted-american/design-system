import type { TOC } from '@ember/component/template-only';

export interface FormRadioInputSignature {
  Args: {
    checked: boolean;
    name: string;
    identifier: string;
    isRequired?: boolean;
  };
  Element: HTMLInputElement;
}

<template>
  <input
    type="radio"
    class="form-check-input"
    name={{@name}}
    id={{@identifier}}
    checked={{@checked}}
    required={{@isRequired}}
    ...attributes
  />
</template> satisfies TOC<FormRadioInputSignature>;
