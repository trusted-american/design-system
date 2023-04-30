import Component from '@glimmer/component';

export interface MainHeaderSignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class MainHeader extends Component<MainHeaderSignature> {
  <template>
    <header class='container-fluid bg-light border-bottom pt-4' ...attributes>
      {{yield}}
    </header>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Main::Header': typeof MainHeader;
  }
}
