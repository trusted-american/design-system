import Component from '@glimmer/component';

export interface ToastSignature {
  Args: {
    color?: string;
    onClose?: () => void;
  };
  Blocks: {
    title: [];
    body: [];
    buttons: [];
  };
}

export default class Toast extends Component<ToastSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Toast: typeof Toast;
  }
}
