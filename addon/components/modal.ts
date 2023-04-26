import Component from '@glimmer/component';

export interface ModalComponentSignature {
  Element: HTMLDivElement;
  Args: {
    title: string;
    size?: 'sm' | 'lg' | 'xl';
    static?: boolean;
    keyboard?: boolean;
    focus?: boolean;
    scroll?: boolean;
    fullscreen?: boolean;
    hideClose?: boolean;
    onClose: () => void;
  };
  Blocks: {
    default: [];
    footer: [];
  };
}

export default class ModalComponent extends Component<ModalComponentSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Modal: typeof ModalComponent;
  }
}
