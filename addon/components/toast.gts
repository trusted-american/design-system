import Component from '@glimmer/component';
import { concat } from '@ember/helper';
import { on } from '@ember/modifier';
import BsCloseButton from 'ember-simple-bootstrap/components/bs/close-button';
import BsToast from 'ember-simple-bootstrap/components/bs/toast';
import eq from 'ember-truth-helpers/helpers/eq';

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
  <template>
    <BsToast class='mt-3 {{if @color (concat "text-bg-" @color)}}' as |toast|>
      {{#if (has-block 'title')}}
        <toast.header>
          {{#if (eq 'success' @color)}}
            {{!-- <FaIcon @icon="check" @fixedWidth={{true}} class="me-1" /> --}}
          {{else if (eq 'warning' @color)}}
            {{!-- <FaIcon @icon="triangle-exclamation" @fixedWidth={{true}} class="me-1" /> --}}
          {{else if (eq 'danger' @color)}}
            {{!-- <FaIcon @icon="xmark" @fixedWidth={{true}} class="me-1" /> --}}
          {{else}}
            {{!-- <FaIcon @icon="info" @fixedWidth={{true}} class="me-1" /> --}}
          {{/if}}
          <span class='fw-semibold'>
            {{yield to='title'}}
          </span>
        </toast.header>
      {{/if}}
      <div class='d-flex align-items-center'>
        <toast.body class='flex-grow-1'>
          {{yield to='body'}}
          {{#if (has-block 'buttons')}}
            <div class='mt-2 pt-2 border-top'>
              {{yield to='buttons'}}
            </div>
          {{/if}}
        </toast.body>
        {{#if @onClose}}
          <BsCloseButton
            @white={{if @color true false}}
            data-bs-dismiss='toast'
            class='me-2'
            {{on 'click' @onClose}}
          />
        {{/if}}
      </div>
    </BsToast>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Toast: typeof Toast;
  }
}
