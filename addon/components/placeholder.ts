import Component from '@glimmer/component';

export interface PlaceholderSignature {
  Args: {
    icon: string;
    title: string;
    subtitle?: string;
    buttonTitle?: string;
    buttonIcon?: string;
    onClick?: () => void;
  };
  Element: HTMLElement;
}

export default class Placeholder extends Component<PlaceholderSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Placeholder: typeof Placeholder;
  }
}
