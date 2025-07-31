import Component from '@glimmer/component';
import { type SafeString, htmlSafe } from '@ember/template';
import { concat } from '@ember/helper';
import { eq } from 'ember-truth-helpers';

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
    return htmlSafe(`width: ${(this.args.value * 100).toString()}%;`);
  }

  <template>
    <div
      class="h-2.5 rounded-full
        {{if
          (eq 'primary' @color)
          'bg-blue-600'
          (if
            (eq 'success' @color)
            'bg-success-600'
            (if
              (eq 'danger' @color)
              'bg-red-600'
              (if
                (eq 'warning' @color)
                'bg-yellow-600'
                (if (eq 'info' @color) 'bg-sky-600' 'bg-gray-600')
              )
            )
          )
        }}
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
