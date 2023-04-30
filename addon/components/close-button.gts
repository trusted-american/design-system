import Component from '@glimmer/component';
import BsCloseButton from 'ember-simple-bootstrap/components/bs/close-button';

export interface CloseButtonSignature {
  Element: HTMLButtonElement;
}

export default class CloseButton extends Component<CloseButtonSignature> {
  <template>
    <BsCloseButton ...attributes />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    CloseButton: typeof CloseButton;
  }
}
