import Component from '@glimmer/component';

export interface FlyoutComponentSignature {
  Element: HTMLDivElement;
  Args: {
    title: string;
    onClose: () => void;
  };
  Blocks: {
    default: [];
  };
}

export default class FlyoutComponent extends Component<FlyoutComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Flyout: typeof FlyoutComponent;
  }
}
