import Component from '@glimmer/component';

export interface ToastComponentSignature {
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

export default class ToastComponent extends Component<ToastComponentSignature> {}
