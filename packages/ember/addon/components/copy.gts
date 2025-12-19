import type { TOC } from '@ember/component/template-only';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';

const copy = async (
  value: string,
  onSuccess?: () => void,
  onError?: () => void,
) => {
  try {
    await navigator.clipboard.writeText(value);
    if (onSuccess) onSuccess();
  } catch {
    if (onError) onError();
  }
};

export interface CopySignature {
  Args: {
    value: string;
    container?: string | Element;
    delegateClickEvent?: boolean;
    onSuccess?: () => void;
    onError?: () => void;
    isButton?: boolean;
    isFullWidth?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLButtonElement;
}

<template>
  <button
    type="button"
    {{!-- TODO: args unused after ember-cli-clipboard removal
    @container={{@container}}
    @delegateClickEvent={{@delegateClickEvent}} --}}
    class="{{if @isButton 'btn btn-secondary' 'tds-copy'}}
      {{if @isFullWidth 'w-100'}}"
    data-test-copy
    {{on "click" (fn copy @value @onSuccess @onError)}}
    ...attributes
  >
    {{yield}}
  </button>
</template> satisfies TOC<CopySignature>;
