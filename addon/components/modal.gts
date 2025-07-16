import Component from '@glimmer/component';
import { action } from '@ember/object';
import { modifier } from 'ember-modifier';
import { Modal as BootstrapModal } from 'bootstrap';
import CloseButton from './close-button';
import { concat } from '@ember/helper';

export interface ModalSignature {
  Args: {
    title: string;
    size?: 'sm' | 'lg' | 'xl';
    isStatic?: boolean;
    isKeyboard?: boolean;
    isFocus?: boolean;
    isFullscreen?: boolean;
    hideClose?: boolean;
    closeButtonLabel: string;
    onClose: () => void;
  };
  Blocks: {
    default: [() => void];
    footer: [() => void];
  };
  Element: HTMLDivElement;
}

export default class Modal extends Component<ModalSignature> {
  modal?: BootstrapModal;

  setup = modifier((element) => {
    this.modal = new BootstrapModal(element, {
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

    // https://github.com/twbs/bootstrap/issues/41005
    element.addEventListener('hide.bs.modal', () => {
      if (document.activeElement instanceof HTMLElement) {
        document.activeElement.blur();
      }
    });

    element.addEventListener('hidden.bs.modal', () => {
      this.args.onClose();
    });

    this.modal.show();
  });

  @action
  close(): void {
    if (!this.modal) {
      throw new Error();
    }

    this.modal.hide();
  }

  willDestroy(): void {
    super.willDestroy();

    if (!this.modal) {
      throw new Error();
    }

    this.modal.hide();
  }

  <template>
    <div
      class="modal fade"
      tabindex="-1"
      data-test-modal
      {{this.setup}}
      ...attributes
    >
      <div
        class="modal-dialog modal-dialog-scrollable
          {{if @size (concat 'modal-' @size)}}
          {{if @isFullscreen 'modal-fullscreen'}}"
      >
        <div class="modal-content">
          {{#if @title}}
            <div class="modal-header">
              <h6 class="modal-title">{{@title}}</h6>
              {{#unless @hideClose}}
                <CloseButton
                  @label={{@closeButtonLabel}}
                  data-bs-dismiss="modal"
                />
              {{/unless}}
            </div>
          {{/if}}
          <div class="modal-body">
            {{yield this.close}}
          </div>
          {{#if (has-block "footer")}}
            <div class="modal-footer">
              {{yield this.close to="footer"}}
            </div>
          {{/if}}
        </div>
      </div>
    </div>
  </template>
}
