import Component from '@glimmer/component';

import '@glint/environment-ember-loose';

export interface AlertSignature {
  Args: {
    color?: string;
    icon?: string;
  };
  Blocks: {
    title: [];
    body: [];
  };
  Element: HTMLDivElement;
}

export default class Alert extends Component<AlertSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Alert: typeof Alert;
  }
}
