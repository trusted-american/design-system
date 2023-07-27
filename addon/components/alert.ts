import Component from '@glimmer/component';

export interface AlertSignature {
  Element: HTMLDivElement;
  Args: {
    color?: string;
    icon?: string;
  };
  Blocks: {
    title: [];
    body: [];
  };
}

export default class Alert extends Component<AlertSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Alert: typeof Alert;
  }
}
