import Component from '@glimmer/component';
import { Toast as BootstrapToast } from 'bootstrap';
import { action } from '@ember/object';

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

export default class Toast extends Component<ToastSignature> {
  toast?: BootstrapToast;

  @action
  didInsert(element: Element): void {
    const toast = new BootstrapToast(element, {
      autohide: false,
    });
    this.toast = toast;

    toast.show();

    const { onClose } = this.args;
    if (onClose) {
      element.addEventListener('hidden.bs.toast', () => {
        onClose();
      });
    }
  }

  willDestroy(): void {
    super.willDestroy();

    if (this.toast) {
      this.toast.hide();
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Toast: typeof Toast;
  }
}
