import Component from '@glimmer/component';

export interface IconSignature {
  Args: {
    icon: string;
    color?: string;
    isFixedWidth?: boolean;
    size?: string;
    prefix?: string;
    transform?: string;
  };
  Element: HTMLElement;
}

export default class Icon extends Component<IconSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Icon: typeof Icon;
  }
}
