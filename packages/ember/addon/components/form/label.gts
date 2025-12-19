import type { TOC } from '@ember/component/template-only';
import Badge from '../badge';

export interface FormLabelSignature {
  Args: {
    label: string;
    for: string;
    isRequired?: boolean;
    requiredLabel: string;
    isCheck?: boolean;
  };
  Element: HTMLLabelElement;
}

<template>
  <label
    for={{@for}}
    class={{if @isCheck "form-check-label" "form-label"}}
    data-test-form-label
    ...attributes
  >
    {{@label}}
    {{#if @isRequired}}
      <Badge @label={{@requiredLabel}} @color="light" class="ms-1" />
    {{/if}}
  </label>
</template> satisfies TOC<FormLabelSignature>;
