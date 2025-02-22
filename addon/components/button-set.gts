import Component from '@glimmer/component';

export interface ButtonSetSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

export default class ButtonSet extends Component<ButtonSetSignature> {
  <template>
    <div class="d-flex gap-2" data-test-button-set ...attributes>
      {{yield}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ButtonSet: typeof ButtonSet;
  }
}
