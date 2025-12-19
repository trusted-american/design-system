import type { TOC } from '@ember/component/template-only';
import { faInfoCircle } from '@fortawesome/free-solid-svg-icons';
import tooltip from '../../../modifiers/tooltip';
import Icon from '../../icon';

export interface PropertyListItemKeySignature {
  Args: {
    label: string;
    help?: string;
  };
  Element: HTMLElement;
}

<template>
  <dt class="text-secondary" ...attributes>
    {{@label}}
    {{#if @help}}
      <a href="#" class="text-secondary ms-1">
        <Icon @icon={{faInfoCircle}} {{tooltip @help}} />
      </a>
    {{/if}}
  </dt>
</template> satisfies TOC<PropertyListItemKeySignature>;
