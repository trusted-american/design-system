import type { TOC } from '@ember/component/template-only';
import { on } from '@ember/modifier';
import { htmlSafe } from '@ember/template';
import type { IconDefinition } from '@fortawesome/fontawesome-svg-core';
import { and } from 'ember-truth-helpers';
import Button from './button';
import Icon from './icon';

interface Args {
  icon: IconDefinition;
  title: string;
  subtitle?: string;
}

interface DefaultArgs extends Args {
  buttonLabel?: never;
  secondaryButtonLabel?: never;
  onClick?: never;
  onSecondaryClick?: never;
}

interface SingleButtonArgs extends Args {
  buttonLabel: string;
  secondaryButtonLabel?: never;
  onClick: () => void;
  onSecondaryClick?: never;
}

interface DoubleButtonArgs extends Args {
  buttonLabel: string;
  secondaryButtonLabel: string;
  onClick: () => void;
  onSecondaryClick: () => void;
}

export interface PlaceholderSignature {
  Args: DefaultArgs | SingleButtonArgs | DoubleButtonArgs;
  Element: HTMLElement;
}

<template>
  <div
    class="d-flex justify-content-center"
    data-test-placeholder
    ...attributes
  >
    <div class="text-center" style={{htmlSafe "max-width: 25rem;"}}>
      <h1 class="mb-3">
        <Icon @icon={{@icon}} />
      </h1>
      <h4 class="mb-0" data-test-title>
        {{@title}}
      </h4>
      {{#if @subtitle}}
        <p class="text-secondary mt-2 mb-0" data-test-subtitle>
          {{@subtitle}}
        </p>
      {{/if}}
      {{#if (and @buttonLabel @onClick)}}
        <Button
          @label={{@buttonLabel}}
          @color="success"
          class="mt-3"
          {{on "click" @onClick}}
        />
      {{/if}}
      {{#if (and @onClick @onSecondaryClick)}}
        <br />
      {{/if}}
      {{#if (and @secondaryButtonLabel @onSecondaryClick)}}
        <Button
          @label={{@secondaryButtonLabel}}
          class="mt-3"
          {{on "click" @onSecondaryClick}}
        />
      {{/if}}
    </div>
  </div>
</template> satisfies TOC<PlaceholderSignature>;
