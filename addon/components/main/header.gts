import Component from '@glimmer/component';

export interface MainHeaderComponentSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainHeaderComponent extends Component<MainHeaderComponentSignature> {
  <template>
    <header class="container-fluid bg-light border-bottom pt-4" ...attributes>
      {{yield}}
    </header>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Header': typeof MainHeaderComponent;
  }
}
