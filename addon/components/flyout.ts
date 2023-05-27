import Component from '@glimmer/component';

export interface FlyoutSignature {
  Element: HTMLDivElement;
  Args: {
    title: string;
    onClose: () => void;
  };
  Blocks: {
    default: [];
  };
}

export default class Flyout extends Component<FlyoutSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Flyout: typeof Flyout;
  }
}
