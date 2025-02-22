import Component from '@glimmer/component';
import { Toast as BootstrapToast } from 'bootstrap';
import { action } from '@ember/object';
import { concat } from '@ember/helper';
import tdsDidInsert from '../modifiers/tds-did-insert';
import CloseButton from './close-button';
import { on } from '@ember/modifier';
import { eq } from 'ember-truth-helpers';

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

  <template>
    <div
      class="toast mt-3 {{if @color (concat 'text-bg-' @color)}}"
      role="alert"
      data-test-toast
      {{tdsDidInsert this.didInsert}}
    >
      {{#if (has-block "title")}}
        <div class="toast-header">
          {{#if (eq "success" @color)}}
            {{!-- <Icon @icon="check" @fixedWidth={{true}} class="me-1" /> --}}
          {{else if (eq "warning" @color)}}
            {{!-- <Icon @icon="triangle-exclamation" @fixedWidth={{true}} class="me-1" /> --}}
          {{else if (eq "danger" @color)}}
            {{!-- <Icon @icon="xmark" @fixedWidth={{true}} class="me-1" /> --}}
          {{else}}
            {{!-- <Icon @icon="info" @fixedWidth={{true}} class="me-1" /> --}}
          {{/if}}
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

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Toast: typeof Toast;
  }
}
