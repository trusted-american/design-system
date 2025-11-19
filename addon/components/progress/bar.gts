import { concat } from '@ember/helper';
import { type SafeString, trustHTML } from '@ember/template';
import Component from '@glimmer/component';

export interface ProgressBarSignature {
  Args: {
    value: number;
    color?: string;
    isLabeled?: boolean;
    isStriped?: boolean;
    isAnimated?: boolean;
  };
  Element: HTMLDivElement;
}

export default class ProgressBar extends Component<ProgressBarSignature> {
  get style(): SafeString {
    return trustHTML(`width: ${(this.args.value * 100).toString()}%;`);
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
