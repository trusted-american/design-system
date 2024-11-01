import Component from '@glimmer/component';

export interface CopyButtonFullSignature {
  Args: {
    text: string;
    isFullWidth?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class CopyButtonFull extends Component<CopyButtonFullSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Copy::ButtonFull': typeof CopyButtonFull;
  }
}
