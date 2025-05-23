import Component from '@glimmer/component';
import { Toast as BootstrapToast } from 'bootstrap';
import { modifier } from 'ember-modifier';
import { concat } from '@ember/helper';
import CloseButton from './close-button';
import { on } from '@ember/modifier';

export interface ToastSignature {
  Args: {
    color?: string;
    closeButtonLabel: string;
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

  setup = modifier((element) => {
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
  });

  willDestroy(): void {
    super.willDestroy();

    if (this.toast) {
      this.toast.hide();
    }
  }

  <template>
    <div
      class="toast mt-3 {{if @color (concat 'text-bg-' @color)}}"
      role="alert"
      data-test-toast
      {{this.setup}}
    >
      {{#if (has-block "title")}}
        <div class="toast-header">
          <span class="fw-semibold">
            {{yield to="title"}}
          </span>
        </div>
      {{/if}}
      <div class="d-flex align-items-center">
        <div class="toast-body flex-grow-1">
          {{yield to="body"}}
          {{#if (has-block "buttons")}}
            <div class="mt-2 pt-2 border-top">
              {{yield to="buttons"}}
            </div>
          {{/if}}
        </div>
        {{#if @onClose}}
          <CloseButton
            @label={{@closeButtonLabel}}
            class="me-2 {{if @color 'btn-close-white'}}"
            data-bs-dismiss="toast"
            {{on "click" @onClose}}
          />
        {{/if}}
      </div>
    </div>
  </template>
}
