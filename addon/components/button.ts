import Component from '@glimmer/component';

export interface ButtonSignature {
  Args: {
    isSubmit?: true;
    text: string;
    icon?: string;
    iconTrailing?: boolean;
    iconOnly?: boolean;
    size?: 'sm' | 'lg';
    outline?: boolean;
    isFullWidth?: boolean;
    color?: string;
    loading?: boolean;
    route?: string;
    href?: string;
    count?: number;
  };
  Element: HTMLButtonElement | HTMLAnchorElement;
}

export default class Button extends Component<ButtonSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof Button;
  }
}
