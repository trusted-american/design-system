import Component from '@glimmer/component';
import BsModal from 'ember-simple-bootstrap/components/bs/modal';

export interface ModalSignature {
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

export default class Modal extends Component<ModalSignature> {
  <template>
    <BsModal
      @title={{@title}}
      @size={{@size}}
      @static={{@static}}
      @keyboard={{@keyboard}}
      @focus={{@focus}}
      @scroll={{@scroll}}
      @fullscreen={{@fullscreen}}
      @hideClose={{@hideClose}}
      @onClose={{@onClose}}
      ...attributes
      as |modal|
    >
      <modal.body>
        {{yield}}
      </modal.body>
      {{#if (has-block 'footer')}}
        <modal.footer>
          {{yield to='footer'}}
        </modal.footer>
      {{/if}}
    </BsModal>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Modal: typeof Modal;
  }
}
