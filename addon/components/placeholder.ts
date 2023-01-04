import Component from '@glimmer/component';

export interface PlaceholderComponentSignature {
  Element: HTMLElement;
  Args: {
    icon: string;
    title: string;
    subtitle?: string;
    onClick?: () => void;
  };
}

export default class PlaceholderComponent extends Component<PlaceholderComponentSignature> {}
