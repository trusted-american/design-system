import Component from '@glimmer/component';
import Badge from '../badge';
import Icon from '../icon';
import SpinnerInternal from '../spinner/internal';
import { and, not } from 'ember-truth-helpers';

import type { IconPrefix } from '@fortawesome/fontawesome-svg-core';

export interface ButtonInternalSignature {
  Args: {
    label: string;
    icon?: string;
    iconPrefix?: IconPrefix;
    isIconTrailing?: boolean;
    isIconOnly?: boolean;
    isLoading?: boolean;
    count?: number;
    shortcut?: string;
  };
  Element: SVGElement;
}

export default class ButtonInternal extends Component<ButtonInternalSignature> {
  <template>
    {{#if @isLoading}}
      <SpinnerInternal />
    {{/if}}
    {{if (and (not @isIconOnly) @isIconTrailing) @label}}
    {{#if @icon}}
      <Icon
        @icon={{@icon}}
        @prefix={{@iconPrefix}}
        class={{unless @isIconOnly (if @isIconTrailing "ms-1" "me-1")}}
        ...attributes
      />
    {{/if}}
    {{if (and (not @isIconOnly) (not @isIconTrailing)) @label}}
    {{#if @count}}
      <Badge @label="{{@count}}" @isPill={{true}} class="ms-1" />
    {{/if}}
    {{#if @shortcut}}
      <kbd>{{@shortcut}}</kbd>
    {{/if}}
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Button::Internal': typeof ButtonInternal;
  }
}
