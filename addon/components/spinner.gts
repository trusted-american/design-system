import Component from '@glimmer/component';
import SpinnerInternal from './spinner/internal';

export interface SpinnerSignature {
  Element: HTMLDivElement;
}

export default class Spinner extends Component<SpinnerSignature> {
  <template>
    <div
      class="d-flex align-items-center justify-content-center"
      data-test-spinner
      ...attributes
    >
      <SpinnerInternal class="text-primary" />
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Spinner: typeof Spinner;
  }
}
