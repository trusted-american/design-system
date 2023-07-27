import Component from '@glimmer/component';

export interface PlaceholderSignature {
  Element: HTMLElement;
  Args: {
    icon: string;
    title: string;
    subtitle?: string;
    onClick?: () => void;
  };
}

export default class Placeholder extends Component<PlaceholderSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Placeholder: typeof Placeholder;
  }
}
