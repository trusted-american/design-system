import Component from '@glimmer/component';

export interface MainFooterSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLElement;
}

export default class MainFooter extends Component<MainFooterSignature> {
  <template>
    <footer
      class="container-fluid text-center text-secondary border-top p-4"
      data-test-main-footer
      ...attributes
    >
      {{yield}}
    </footer>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Footer': typeof MainFooter;
  }
}
