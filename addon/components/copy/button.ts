import Component from '@glimmer/component';

export interface CopyButtonSignature {
  Args: {
    text: unknown;
    delegateClickEvent?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class CopyButton extends Component<CopyButtonSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Copy::Button': typeof CopyButton;
  }
}
