import Component from '@glimmer/component';

export interface ButtonComponentSignature {
  Element: HTMLElement;
  Args: {
    text: string;
    color?: string;
    icon?: string;
  };
}

export default class ButtonComponent extends Component<ButtonComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Button: typeof ButtonComponent;
  }
}
