import Component from '@glimmer/component';

export interface SubheadingSignature {
  Element: HTMLElement;
  Args: {
    title: string;
  };
  Blocks: {
    default: [];
  };
}

export default class Subheading extends Component<SubheadingSignature> {
  <template>
    <div
      class='tds-subheading d-flex justify-content-between align-items-start mb-4'
      ...attributes
    >
      <h5 class='mb-0'>
        {{@title}}
      </h5>
      {{yield}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Subheading: typeof Subheading;
  }
}
