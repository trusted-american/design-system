import Component from '@glimmer/component';
import { Offcanvas } from 'bootstrap';
import { action } from '@ember/object';

export interface FlyoutSignature {
  Args: {
    title: string;
    onClose: () => void;
  };
  Blocks: {
    default: [];
    footer: [];
  };
  Element: HTMLDivElement;
}

export default class Flyout extends Component<FlyoutSignature> {
  offcanvas?: Offcanvas;

  @action
  didInsert(element: Element): void {
    this.offcanvas = new Offcanvas(element);
    this.offcanvas.show();

    const { onClose } = this.args;
    element.addEventListener('hidden.bs.offcanvas', () => {
      onClose();
    });
  }

  willDestroy(): void {
    super.willDestroy();

    if (this.offcanvas) {
      this.offcanvas.hide();
    }
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Flyout: typeof Flyout;
  }
}
