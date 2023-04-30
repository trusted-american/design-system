import Component from '@glimmer/component';

export interface ButtonSetSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [];
  };
}

export default class ButtonSet extends Component<ButtonSetSignature> {
  <template>
    <div class='d-flex gap-2' ...attributes>
      {{yield}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    ButtonSet: typeof ButtonSet;
  }
}
