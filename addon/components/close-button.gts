import Component from '@glimmer/component';
import BsCloseButton from 'ember-simple-bootstrap/components/bs/close-button';

export interface CloseButtonComponentSignature {
  Element: HTMLButtonElement;
}

export default class CloseButtonComponent extends Component<CloseButtonComponentSignature> {
  <template>
    <BsCloseButton ...attributes />
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    CloseButton: typeof CloseButtonComponent;
  }
}
