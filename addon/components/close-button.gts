import Component from '@glimmer/component';

export interface CloseButtonSignature {
  Args: {
    label: string;
  };
  Element: HTMLButtonElement;
}

export default class CloseButton extends Component<CloseButtonSignature> {
  <template>
    <button
      type="button"
      class="btn-close"
      aria-label={{@label}}
      data-test-close-button
      ...attributes
    ></button>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    CloseButton: typeof CloseButton;
  }
}
