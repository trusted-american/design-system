import Component from '@glimmer/component';
import { htmlSafe } from '@ember/template';

import type { SafeString } from '@ember/template/-private/handlebars';

interface ProgressBarSignature {
  Args: {
    value: number;
    color?: string;
    labeled?: boolean;
    striped?: boolean;
    animated?: boolean;
  };
  Element: HTMLDivElement;
}

export default class ProgressBar extends Component<ProgressBarSignature> {
  get style(): SafeString {
    return htmlSafe(`width: ${this.args.value}%;`);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Progress::Bar': typeof ProgressBar;
  }
}
