import Component from '@glimmer/component';

export interface MainTopHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class MainTopHeader extends Component<MainTopHeaderSignature> {
  <template>
    <header
      class="container-fluid position-relative border-bottom py-3"
      data-test-main-top-header
      ...attributes
    >
      {{yield}}
    </header>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::TopHeader': typeof MainTopHeader;
  }
}
