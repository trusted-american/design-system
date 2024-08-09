import Component from '@glimmer/component';

export interface ButtonInternalSignature {
  Args: {
    text: string;
    icon?: string;
    iconPrefix?: string;
    isIconTrailing?: boolean;
    isIconOnly?: boolean;
    isLoading?: boolean;
    count?: number;
  };
  Element: HTMLElement;
}

export default class ButtonInternal extends Component<ButtonInternalSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Button::Internal': typeof ButtonInternal;
  }
}
