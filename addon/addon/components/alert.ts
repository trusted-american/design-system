import Component from '@glimmer/component';

import type { IconName } from '@fortawesome/fontawesome-svg-core';

interface Args {
  color?: string;
  icon?: IconName;
}

interface Args1 extends Args {
  closeText?: never;
  onClose?: never;
}

interface Args2 extends Args {
  closeText: string;
  onClose: () => void;
}

export interface AlertSignature {
  Args: Args1 | Args2;
  Blocks: {
    title: [];
    default: [];
  };
  Element: HTMLDivElement;
}

export default class Alert extends Component<AlertSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Alert: typeof Alert;
  }
}
