import Component from '@glimmer/component';

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

export default class ButtonInternal extends Component<ButtonInternalSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Button::Internal': typeof ButtonInternal;
  }
}
