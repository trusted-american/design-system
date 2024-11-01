import Component from '@glimmer/component';

export interface CopySignature {
  Args: {
    text: string;
    delegateClickEvent?: boolean;
    isButton?: boolean;
    isFullWidth?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class Copy extends Component<CopySignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Copy: typeof Copy;
  }
}
