import Component from '@glimmer/component';

export interface ButtonGroupSignature {
  Args: {
    size?: 'sm' | 'lg';
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class ButtonGroup extends Component<ButtonGroupSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ButtonGroup: typeof ButtonGroup;
  }
}
