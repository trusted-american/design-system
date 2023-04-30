import Component from '@glimmer/component';

export interface MainFooterComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainFooterComponent extends Component<MainFooterComponentSignature> {
  <template>
    <footer
      class="container-fluid text-center text-secondary border-top p-4"
      ...attributes
    >
      {{yield}}
    </footer>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Footer': typeof MainFooterComponent;
  }
}
