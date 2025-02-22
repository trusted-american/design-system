import Component from '@glimmer/component';

export interface SubheadingSignature {
  Args: {
    title: string;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class Subheading extends Component<SubheadingSignature> {
  <template>
    <div
      class="d-flex justify-content-between align-items-start gap-2 mb-4"
      data-test-subheading
      ...attributes
    >
      <h2 class="mb-0">
        {{@title}}
      </h2>
      {{yield}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Subheading: typeof Subheading;
  }
}
