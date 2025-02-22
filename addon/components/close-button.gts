import type { TOC } from '@ember/component/template-only';

export interface CloseButtonSignature {
  Args: {
    label: string;
  };
  Element: HTMLButtonElement;
}

const CloseButton: TOC<CloseButtonSignature> = <template>
  <button
    type="button"
    class="btn-close"
    aria-label={{@label}}
    data-test-close-button
    ...attributes
  ></button>
</template>;

export default CloseButton;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    CloseButton: typeof CloseButton;
  }
}
