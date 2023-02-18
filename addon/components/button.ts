import Component from '@glimmer/component';

export interface ButtonComponentSignature {
  Element: HTMLElement;
  Args: {
    isSubmit?: true;
    text: string;
    size?: 'sm' | 'lg';
    outline?: boolean;
    color?: string;
    icon?: string;
    loading?: unknown;
  };
}

export default class ButtonComponent extends Component<ButtonComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof ButtonComponent;
  }
}