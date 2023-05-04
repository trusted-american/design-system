import Component from '@glimmer/component';

export interface ButtonComponentSignature {
  Element: HTMLButtonElement | HTMLAnchorElement;
  Args: {
    isSubmit?: true;
    text: string;
    icon?: string;
    iconTrailing?: boolean;
    iconOnly?: boolean;
    size?: 'sm' | 'lg';
    outline?: boolean;
    color?: string;
    loading?: unknown;
    route?: string;
    href?: string;
  };
}

export default class ButtonComponent extends Component<ButtonComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof ButtonComponent;
  }
}
