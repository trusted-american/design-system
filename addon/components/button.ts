import Component from '@glimmer/component';

export interface LinkToArgs {
  route?: string;
  model?: unknown;
  query?: Record<string, unknown>;
}

interface Args extends LinkToArgs {
  isSubmit?: true;
  text: string;
  icon?: string;
  iconPrefix?: string;
  isIconTrailing?: boolean;
  isIconOnly?: boolean;
  size?: 'sm' | 'lg';
  isOutline?: boolean;
  isFullWidth?: boolean;
  color?: string;
  isLoading?: boolean;
  href?: string;
  count?: number;
}

export interface ButtonSignature {
  Args: Args;
  Element: HTMLButtonElement | HTMLAnchorElement;
}

export default class Button extends Component<ButtonSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof Button;
  }
}
