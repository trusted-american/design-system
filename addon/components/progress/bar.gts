import Component from '@glimmer/component';
import { type SafeString, htmlSafe } from '@ember/template';
import { concat } from '@ember/helper';

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

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Progress::Bar': typeof ProgressBar;
    'progress/bar': typeof ProgressBar;
  }
}
