import { concat } from '@ember/helper';
import { type SafeString, htmlSafe } from '@ember/template';
import Component from '@glimmer/component';
import type { Color } from '@trusted-american/core';

export interface ProgressBarSignature {
  Args: {
    value: number;
    color?: Color;
    isLabeled?: boolean;
    isStriped?: boolean;
    isAnimated?: boolean;
  };
  Element: HTMLDivElement;
}

export default class ProgressBar extends Component<ProgressBarSignature> {
  get style(): SafeString {
    return htmlSafe(`width: ${(this.args.value * 100).toString()}%;`);
  }

  <template>
    <div
      class="progress-bar
        {{if @color (concat 'bg-' @color)}}
        {{if @isStriped 'progress-bar-striped'}}
        {{if @isAnimated 'progress-bar-animated'}}"
      role="progressbar"
      style={{this.style}}
      data-test-progress-bar
      ...attributes
    >
      {{#if @isLabeled}}
        {{@value}}%
      {{/if}}
    </div>
  </template>
}
