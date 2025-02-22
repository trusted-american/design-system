import Component from '@glimmer/component';

export interface MainBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class MainBody extends Component<MainBodySignature> {
  <template>
    <article
      class="container-fluid flex-grow-1 py-4"
      data-test-main-body
      ...attributes
    >
      {{yield}}
    </article>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Body': typeof MainBody;
  }
}
