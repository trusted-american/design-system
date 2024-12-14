import Component from '@glimmer/component';
import { htmlSafe, type SafeString } from '@ember/template';

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
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Progress::Bar': typeof ProgressBar;
    'progress/bar': typeof ProgressBar;
  }
}
