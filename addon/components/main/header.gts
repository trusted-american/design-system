import Component from '@glimmer/component';

export interface MainHeaderSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class MainHeader extends Component<MainHeaderSignature> {
  <template>
    <header
      class="container-fluid bg-body-tertiary pt-4"
      data-test-main-header
      ...attributes
    >
      {{yield}}
    </header>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Header': typeof MainHeader;
  }
}
