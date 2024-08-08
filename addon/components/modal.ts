import Component from '@glimmer/component';
import { action } from '@ember/object';
import { Modal as _Modal } from 'bootstrap';

export interface ModalSignature {
  Args: {
    title: string;
    size?: 'sm' | 'lg' | 'xl';
    isStatic?: boolean;
    isKeyboard?: boolean;
    isFocus?: boolean;
    isScroll?: boolean;
    isFullscreen?: boolean;
    hideClose?: boolean;
    onClose: () => void;
  };
  Blocks: {
    default: [() => void];
    footer: [() => void];
  };
  Element: HTMLDivElement;
}

export default class Modal extends Component<ModalSignature> {
  modal?: _Modal;

  @action
  didInsert(element: Element): void {
    this.modal = new _Modal(element, {
      backdrop: this.args.isStatic ? 'static' : true,
      keyboard: this.args.isKeyboard ?? true,
      focus: this.args.isFocus ?? true,
    });

    element.addEventListener('shown.bs.modal', () => {
      if (this.isDestroyed) {
        this.modal?.hide();
      }

      const autofocus = element.querySelector<HTMLInputElement>('[autofocus]');
      if (autofocus) {
        autofocus.focus();
      }
    });

    element.addEventListener('hidden.bs.modal', () => {
      this.args.onClose();
    });

    this.modal.show();
  }

  @action
  close(): void {
    if (!this.modal) {
      throw new Error();
    }
    this.modal.hide();
  }

  willDestroy(): void {
    super.willDestroy();

    if (this.modal) {
      this.modal.hide();
      // this.modal.dispose();
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Modal: typeof Modal;
  }
}
