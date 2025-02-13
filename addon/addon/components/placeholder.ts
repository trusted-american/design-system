import Component from '@glimmer/component';

import type { IconName } from '@fortawesome/fontawesome-svg-core';

export interface PlaceholderSignature {
  Args: {
    icon: IconName;
    title: string;
    subtitle?: string;
    buttonText?: string;
    secondaryButtonText?: string;
    onClick?: () => void;
    onSecondaryClick?: () => void;
  };
  Element: HTMLElement;
}

export default class Placeholder extends Component<PlaceholderSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Placeholder: typeof Placeholder;
  }
}
