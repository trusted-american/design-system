import { get } from '@ember/helper';
import { type SafeString, htmlSafe } from '@ember/template';
import Component from '@glimmer/component';
import { or } from 'ember-truth-helpers';

const colorVariants = {
  primary: 'bg-blue-600',
  secondary: 'bg-gray-600',
  success: 'bg-green-600',
  danger: 'bg-red-600',
  warning: 'bg-yellow-600',
  info: 'bg-sky-600',
  light: '',
  dark: '',
};

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
      class="{{get colorVariants (or @color 'secondary')}}
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
