import Component from '@glimmer/component';

import type {
  IconName,
  SizeProp,
  IconPrefix,
} from '@fortawesome/fontawesome-svg-core';

export interface IconSignature {
  Args: {
    icon: IconName;
    color?: string;
    isFixedWidth?: boolean;
    size?: SizeProp;
    prefix?: IconPrefix;
    transform?: string;
  };
  Element: SVGElement;
}

export default class Icon extends Component<IconSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Icon: typeof Icon;
  }
}
