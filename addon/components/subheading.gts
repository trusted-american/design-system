import Component from '@glimmer/component';

export interface SubheadingComponentSignature {
  Element: HTMLElement;
  Args: {
    title: string;
  };
  Blocks: {
    default: [];
  };
}

export default class SubheadingComponent extends Component<SubheadingComponentSignature> {
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
    Subheading: typeof SubheadingComponent;
  }
}
